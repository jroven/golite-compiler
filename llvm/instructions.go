package llvm

import (
	"bytes"
	"fmt"
	"proj-optimization-overlords/codegen"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/types"
	"strconv"
)

// <result> = <binTy> <ty> <op1>, <op2>
type BinOp struct {
	dest  *LLVMRegister
	binTy BinOpTy
	ty    types.Type
	op1   LLVMOperand
	op2   LLVMOperand
}

func NewBinOp(dest *LLVMRegister, binTy BinOpTy, ty types.Type, op1 LLVMOperand, op2 LLVMOperand) *BinOp {
	return &BinOp{dest, binTy, ty, op1, op2}
}

func (b *BinOp) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(b.dest.Entry.Name)
	out.WriteString(" = ")
	out.WriteString(b.binTy.String())
	out.WriteString(" ")
	out.WriteString(b.ty.String())
	out.WriteString(" ")
	out.WriteString(b.op1.String())
	out.WriteString(", ")
	out.WriteString(b.op2.String())
	return out.String()
}

func (b *BinOp) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	vars = append(vars, b.dest.Entry)
	if reg := b.op1.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	if reg := b.op2.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (b *BinOp) GetType() string {
	return "BinOp"
}

func TranslateToAssemblyRegHelper(op LLVMOperand, armFunc *codegen.ARMFunction) ([]codegen.Instruction, *codegen.ARMRegister) {
	var instructions []codegen.Instruction
	var armReg *codegen.ARMRegister
	if reg := op.GetRegister(); reg != nil {
		// If op is a register, check if it is in an ARM register
		if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
			// If op is already in an ARM register, do nothing
			return instructions, armOp.GetRegister()
		} else {
			// If op is not already in an ARM register, load it into one
			armReg = codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			armFunc.NextAvailableRegister++
			armLoad := codegen.NewLdr(armReg, armOp)
			instructions = append(instructions, armLoad)
		}
	} else {
		// If op is an immediate, use mov to put it in a register
		imm := op.GetImmediate()
		armReg = codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armImmediate := codegen.NewARMImmediate(imm.value)
		armMov := codegen.NewMov(armReg, armImmediate)
		instructions = append(instructions, armMov)
	}
	return instructions, armReg
}

func (b *BinOp) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	// Prepare op1
	op1Instrs, reg1 := TranslateToAssemblyRegHelper(b.op1, armFunc)
	instructions = append(instructions, op1Instrs...)
	// Prepare op2
	op2Instrs, reg2 := TranslateToAssemblyRegHelper(b.op2, armFunc)
	instructions = append(instructions, op2Instrs...)
	// Perform the operation
	dest := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
	armFunc.NextAvailableRegister++ // Unnecessary, but for consistency
	armBinOp := codegen.NewARMBinOp(b.binTy.ToARM(), dest, reg1, reg2)
	instructions = append(instructions, armBinOp)
	// Store the result in the dest
	if armFunc.VarLocations[b.dest.Entry].GetRegister() != nil {
		armMov := codegen.NewMov(armFunc.VarLocations[b.dest.Entry].GetRegister(), dest)
		instructions = append(instructions, armMov)
	} else {
		armStr := codegen.NewStr(dest, armFunc.VarLocations[b.dest.Entry])
		instructions = append(instructions, armStr)
	}
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	// Return the instructions
	return instructions
}

// <result> = load <ty>, <ty>* <pointer>
type Load struct {
	ty   types.Type
	dest *LLVMRegister // <result>
	op   *LLVMRegister // <pointer>
}

func NewLoad(ty types.Type, dest *LLVMRegister, op *LLVMRegister) *Load {
	return &Load{ty, dest, op}
}

func (l *Load) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(l.dest.Entry.Name)
	out.WriteString(" = load ")
	out.WriteString(types.TypeToLLVMString(l.ty))
	out.WriteString(", ")
	out.WriteString(types.TypeToLLVMString(l.ty))
	out.WriteString("* ")
	out.WriteString(l.op.String())
	return out.String()
}

func (l *Load) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if l.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, l.dest.Entry)
	}
	if l.op.Entry.Scope != st.GLOBAL {
		vars = append(vars, l.op.Entry)
	}
	return vars
}

func (l *Load) GetType() string {
	return "Load"
}

func (l *Load) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister

	if l.op.IsPtr {
		armLdr := codegen.NewLdr(armFunc.VarLocations[l.dest.Entry].GetRegister(), armFunc.VarLocations[l.op.Entry])
		instructions = append(instructions, armLdr)
	}

	new_instructions, armReg := GetARMRegFromLLVMReg(l.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	fmt.Println("New instructions from getting ARMRegFromLLVMReg: ", instructions)

	new_instructions, armOp := GetARMOpFromLLVMReg(l.op, armFunc)
	instructions = append(instructions, new_instructions...)
	fmt.Println("New instructions from getting ARMOpFromLLVMReg: ", instructions)

	fmt.Println("ARMREG: ", armReg, "ARMOP: ", armOp)
	if armOp.GetRegister() != nil {
		// can do a move unless it's a global variable
		if l.op.Entry.Scope == st.GLOBAL {
			armLdr := codegen.NewLdr(armReg, armOp.GetRegister())
			instructions = append(instructions, armLdr)
		} else {
			armMov := codegen.NewMov(armReg, armOp.GetRegister())
			instructions = append(instructions, armMov)
		}
	} else {
		armLdr := codegen.NewLdr(armReg, armOp)
		instructions = append(instructions, armLdr)
		fmt.Println("New instructions: ", instructions)
		if l.dest.Entry.Scope == st.GLOBAL {
			nextReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
			armFunc.NextAvailableRegister++
			armAdrp := codegen.NewAdrp(nextReg, l.dest.Entry.Name)
			instructions = append(instructions, armAdrp)
			armAddLo12 := codegen.NewAddLo12(nextReg, l.dest.Entry.Name)
			instructions = append(instructions, armAddLo12)
		}
	}
	armFunc.NextAvailableRegister = resetVal
	fmt.Println("Instructions from load of ", l.op, " to ", l.dest, ":")
	for _, instr := range instructions {
		fmt.Println(instr.String())
	}
	return instructions
}

// store <ty> <value>, <ty>* <pointer>
type Store struct {
	ty  types.Type
	val LLVMOperand
	op  *LLVMRegister // <pointer>
}

func NewStore(ty types.Type, val LLVMOperand, op *LLVMRegister) *Store {
	return &Store{ty, val, op}
}

func (s *Store) String() string {
	var out bytes.Buffer
	out.WriteString("store ")
	if s.val.GetType() == types.NilTySig {
		out.WriteString("ptr")
	} else {
		out.WriteString(types.TypeToLLVMString(s.ty))
	}
	out.WriteString(" ")
	out.WriteString(s.val.String())
	out.WriteString(", ")
	out.WriteString(types.TypeToLLVMString(s.ty))
	out.WriteString("* ")
	out.WriteString(s.op.String())
	return out.String()
}

func (s *Store) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if reg := s.val.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	if s.op.Entry.Scope != st.GLOBAL {
		vars = append(vars, s.op.Entry)
	}
	return vars
}

func (s *Store) GetType() string {
	return "Store"
}

func (s *Store) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister

	var armPtrReg *codegen.ARMRegister
	addrFlag := false
	var new_instructions []codegen.Instruction
	if armFunc.Locations[s.op.Entry] == nil {
		new_instructions, armPtrReg = GetARMRegFromLLVMReg(s.op, armFunc)
		instructions = append(instructions, new_instructions...)
	} else {
		armPtrReg = codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		addrFlag = true
	}

	new_instructions, armValOp := GetARMOpFromLLVMOp(s.val, armFunc)
	instructions = append(instructions, new_instructions...)
	if addrFlag {
		armStr := codegen.NewStr(armPtrReg, armFunc.VarLocations[s.op.Entry])
		instructions = append(instructions, armStr)
	} else if armValOp.GetImmediate() != nil {
		nextReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armMov := codegen.NewMov(nextReg, armValOp)
		instructions = append(instructions, armMov)
		armStr := codegen.NewStr(armPtrReg, nextReg)
		instructions = append(instructions, armStr)
	} else if armValOp.GetRegister() != nil {
		// can do a move unless it's a global variable
		if s.op.Entry.Scope == st.GLOBAL {
			armStr := codegen.NewStr(armValOp.GetRegister(), armPtrReg)
			instructions = append(instructions, armStr)
		} else {
			fmt.Println("val:", s.val, "op:", s.op, "valType:", s.val.GetType(), "opType:", s.op.GetType())
			if s.op.IsPtr {
				armStr := codegen.NewStr(armValOp.GetRegister(), armPtrReg)
				instructions = append(instructions, armStr)
			} else {
				armMov := codegen.NewMov(armPtrReg, armValOp.GetRegister())
				instructions = append(instructions, armMov)
			}
		}
	} else {
		if s.val.GetRegister() != nil && s.val.GetRegister().Entry.Scope == st.PARAM {
			offsetStackSize := armFunc.StackSize - max(0, len(armFunc.Params)-14)*8
			armValOp = codegen.NewARMAddress(armValOp.GetAddress().Base, []*codegen.ARMImmediate{codegen.NewARMImmediate(armValOp.GetAddress().Offset[0].Val + offsetStackSize)})
		}
		armLdr := codegen.NewLdr(armPtrReg, armValOp)
		instructions = append(instructions, armLdr)
	}
	fmt.Println("Instructions from load of ", s.val, " to ", s.op, ":")
	for _, instr := range instructions {
		fmt.Println(instr.String())
	}

	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// <result> = alloca <ty>
type Alloca struct {
	ty   types.Type
	dest *LLVMRegister // <result>
}

func NewAlloca(ty types.Type, dest *LLVMRegister) *Alloca {
	return &Alloca{ty, dest}
}

func (a *Alloca) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(a.dest.Entry.Name)
	out.WriteString(" = alloca ")
	out.WriteString(types.TypeToLLVMString(a.ty))
	return out.String()
}

func (a *Alloca) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	return vars
}

func (a *Alloca) GetType() string {
	return "Alloca"
}

func (a *Alloca) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	return instructions
}

// %TYPE_NAME = type { <ty1>, <ty2>, <ty3>, ... , <tyN> }
type LLVMTypeDecl struct {
	name string
	tys  []types.Type
}

func NewLLVMTypeDecl(name string, tys []types.Type) *LLVMTypeDecl {
	return &LLVMTypeDecl{name, tys}
}

func (t *LLVMTypeDecl) AddField(ty types.Type) {
	t.tys = append(t.tys, ty)
}

func (t *LLVMTypeDecl) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString("struct.")
	out.WriteString(t.name)
	out.WriteString(" = type {")
	for i, ty := range t.tys {
		out.WriteString(types.TypeToLLVMString(ty))
		if i < len(t.tys)-1 {
			out.WriteString(", ")
		}
	}
	out.WriteString("}")
	return out.String()
}

func (t *LLVMTypeDecl) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	return vars
}

func (t *LLVMTypeDecl) GetType() string {
	return "LLVMTypeDecl"
}

func (t *LLVMTypeDecl) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	return instructions
}

// @VARIABLE_NAME = common global <ty> <constant value>
type LLVMGlobalDecl struct {
	Name     string
	ty       types.Type
	isStruct bool
}

func NewGlobalDecl(name string, ty types.Type, isStruct bool) *LLVMGlobalDecl {
	return &LLVMGlobalDecl{name, ty, isStruct}
}

func (g *LLVMGlobalDecl) String() string {
	var out bytes.Buffer
	out.WriteString("@")
	out.WriteString(g.Name)
	out.WriteString(" = common global ")
	out.WriteString(types.TypeToLLVMString(g.ty))
	if g.isStruct {
		out.WriteString("* null")
	} else {
		out.WriteString(" 0")
	}
	return out.String()
}

func (g *LLVMGlobalDecl) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	return vars
}

func (g *LLVMGlobalDecl) GetType() string {
	return "LLVMGlobalDecl"
}

func (g *LLVMGlobalDecl) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	return instructions
}

// <result> = bitcast <ty> <value> to <ty2>
type Bitcast struct {
	dest *LLVMRegister // <result>
	ty1  types.Type    // <ty>
	val  LLVMOperand   // <value>
	ty2  types.Type    // <ty2>
}

func NewBitcast(dest *LLVMRegister, ty1 types.Type, val LLVMOperand, ty2 types.Type) *Bitcast {
	return &Bitcast{dest, ty1, val, ty2}
}

func (b *Bitcast) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(b.dest.Entry.Name)
	out.WriteString(" = bitcast ")
	out.WriteString(types.TypeToLLVMString(b.ty1))
	out.WriteString(" ")
	out.WriteString(b.val.String())
	out.WriteString(" to ")
	out.WriteString(types.TypeToLLVMString(b.ty2))
	return out.String()
}

func (b *Bitcast) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if b.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, b.dest.Entry)
	}
	if reg := b.val.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (b *Bitcast) GetType() string {
	return "Bitcast"
}

func (b *Bitcast) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	new_instructions, armReg := GetARMRegFromLLVMOp(b.val, armFunc)
	instructions = append(instructions, new_instructions...)
	new_instructions, armOp := GetARMOpFromLLVMReg(b.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	if armOp.GetRegister() != nil {
		armMov := codegen.NewMov(armOp.GetRegister(), armReg)
		instructions = append(instructions, armMov)
	} else {
		armStr := codegen.NewStr(armReg, armOp)
		instructions = append(instructions, armStr)
	}
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// <result> = select <ty1> <cond>, <ty2> <val1>, <ty2> <val2>
type Select struct {
	dest *LLVMRegister // <result>
	ty1  types.Type    // <ty1>
	cond LLVMOperand   // <cond>
	ty2  types.Type    // <ty2>
	val1 LLVMOperand   // <val1>
	val2 LLVMOperand   // <val2>
}

func NewSelect(dest *LLVMRegister, ty1 types.Type, cond LLVMOperand, ty2 types.Type, val1 LLVMOperand, val2 LLVMOperand) *Select {
	return &Select{dest, ty1, cond, ty2, val1, val2}
}

func (s *Select) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(s.dest.Entry.Name)
	out.WriteString(" = select ")
	out.WriteString(types.TypeToLLVMString(s.ty1))
	out.WriteString(" ")
	out.WriteString(s.cond.String())
	out.WriteString(", ")
	out.WriteString(types.TypeToLLVMString(s.ty2))
	out.WriteString(" ")
	out.WriteString(s.val1.String())
	out.WriteString(", ")
	out.WriteString(types.TypeToLLVMString(s.ty2))
	out.WriteString(" ")
	out.WriteString(s.val2.String())
	return out.String()
}

func (s *Select) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if s.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, s.dest.Entry)
	}
	if reg := s.cond.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	if reg := s.val1.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	if reg := s.val2.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (s *Select) GetType() string {
	return "Select"
}

func (s *Select) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	// Prepare the condition
	condInstrs, condReg := TranslateToAssemblyRegHelper(s.cond, armFunc)
	instructions = append(instructions, condInstrs...)
	cmpInstr := codegen.NewCmp(condReg, codegen.NewARMImmediate(1))
	instructions = append(instructions, cmpInstr)
	// Prepare a register for the destination
	destReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
	armFunc.NextAvailableRegister++
	// Perform the cset
	csetInstr := codegen.NewCset(destReg, codegen.EQ)
	instructions = append(instructions, csetInstr)
	// Store the result in the dest
	if s.dest.Entry.Scope == st.GLOBAL {
		nextReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armAdrp := codegen.NewAdrp(nextReg, s.dest.Entry.Name)
		instructions = append(instructions, armAdrp)
		armAddLo12 := codegen.NewAddLo12(nextReg, s.dest.Entry.Name)
		instructions = append(instructions, armAddLo12)
		armStr := codegen.NewStr(destReg, nextReg)
		instructions = append(instructions, armStr)
	} else {
		if armFunc.VarLocations[s.dest.Entry].GetRegister() != nil {
			armMov := codegen.NewMov(armFunc.VarLocations[s.dest.Entry].GetRegister(), destReg)
			instructions = append(instructions, armMov)
		} else {
			armStr := codegen.NewStr(destReg, armFunc.VarLocations[s.dest.Entry])
			instructions = append(instructions, armStr)
		}
	}
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// <result> = trunc <ty1> <val1> to <ty2>
type Trunc struct {
	dest *LLVMRegister // <result>
	ty1  types.Type    // <ty1>
	val1 LLVMOperand   // <val1>
	ty2  types.Type    // <ty2>
}

func NewTrunc(dest *LLVMRegister, ty1 types.Type, val1 LLVMOperand, ty2 types.Type) *Trunc {
	return &Trunc{dest, ty1, val1, ty2}
}

func (t *Trunc) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(t.dest.Entry.Name)
	out.WriteString(" = trunc ")
	out.WriteString(types.TypeToLLVMString(t.ty1))
	out.WriteString(" ")
	out.WriteString(t.val1.String())
	out.WriteString(" to ")
	out.WriteString(types.TypeToLLVMString(t.ty2))
	return out.String()
}

func (t *Trunc) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if t.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, t.dest.Entry)
	}
	if reg := t.val1.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (t *Trunc) GetType() string {
	return "Trunc"
}

func (t *Trunc) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	new_instructions, armReg := GetARMRegFromLLVMOp(t.val1, armFunc)
	instructions = append(instructions, new_instructions...)
	new_instructions, armOp := GetARMOpFromLLVMReg(t.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	if armOp.GetRegister() != nil {
		armMov := codegen.NewMov(armOp.GetRegister(), armReg)
		instructions = append(instructions, armMov)
	} else {
		armStr := codegen.NewStr(armReg, armOp)
		instructions = append(instructions, armStr)
	}
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// <result> = getelementptr <ty>, <ty>* <ptrval>, i32 0, i32 <index>
type GetElementPtr struct {
	dest   *LLVMRegister // <result>
	ty     types.Type    // <ty>
	ptrval *LLVMRegister // <ptrval>
	index  int           // <index>
}

func NewGetElementPtr(dest *LLVMRegister, ty types.Type, ptrval *LLVMRegister, index int) *GetElementPtr {
	return &GetElementPtr{dest, ty, ptrval, index}
}

func (g *GetElementPtr) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(g.dest.Entry.Name)
	out.WriteString(" = getelementptr ")
	out.WriteString(types.TypeToFieldString(g.ty))
	out.WriteString(", ")
	out.WriteString(types.TypeToFieldString(g.ty))
	out.WriteString("* ")
	out.WriteString(g.ptrval.String())
	out.WriteString(", i32 0, i32 ")
	out.WriteString(strconv.Itoa(g.index))
	return out.String()
}

func (g *GetElementPtr) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if g.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, g.dest.Entry)
	}
	if g.ptrval.Entry.Scope != st.GLOBAL {
		vars = append(vars, g.ptrval.Entry)
	}
	return vars
}

func (g *GetElementPtr) GetType() string {
	return "GetElementPtr"
}

func (g *GetElementPtr) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	prevReg := armFunc.NextAvailableRegister
	g.dest.IsPtr = true
	var instructions []codegen.Instruction
	new_instructions, destReg := GetARMRegFromLLVMReg(g.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	new_instructions, ptrReg := GetARMRegWValFromLLVMReg(g.ptrval, armFunc)
	instructions = append(instructions, new_instructions...)
	armImm := codegen.NewARMImmediate(g.index * 8)
	armAdd := codegen.NewAddImm(destReg, ptrReg, armImm)
	instructions = append(instructions, armAdd)
	armFunc.NextAvailableRegister = prevReg
	return instructions
}

// br i1 <cond>, label <iftrue>, label <iffalse>
type BrCond struct {
	Cond    LLVMOperand   // <cond>
	Iftrue  string        // <iftrue>
	Iffalse string        // <iffalse>
	Cc      ConditionCode // cc from the preceding icmp
}

func NewBrCond(cond LLVMOperand, iftrue string, iffalse string, cc ConditionCode) *BrCond {
	return &BrCond{cond, iftrue, iffalse, cc}
}

func (bc *BrCond) String() string {
	var out bytes.Buffer
	out.WriteString("br i1 ")
	out.WriteString(bc.Cond.String())
	out.WriteString(", label %")
	out.WriteString(bc.Iftrue)
	out.WriteString(", label %")
	out.WriteString(bc.Iffalse)
	return out.String()
}

func (bc *BrCond) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if reg := bc.Cond.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (bc *BrCond) GetType() string {
	return "BrCond"
}

func (bc *BrCond) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	trueInstr := codegen.NewBCond(bc.Cc.ToARM(), "."+bc.Iftrue)
	instructions = append(instructions, trueInstr)
	falseInstr := codegen.NewBCond(bc.Cc.Negate().ToARM(), "."+bc.Iffalse)
	instructions = append(instructions, falseInstr)
	return instructions
}

// br label <dest>
type Br struct {
	Dest string // <dest>
}

func NewBr(dest string) *Br {
	return &Br{dest}
}

func (b *Br) String() string {
	var out bytes.Buffer
	out.WriteString("br label %")
	out.WriteString(b.Dest)
	return out.String()
}

func (b *Br) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	return vars
}

func (b *Br) GetType() string {
	return "Br"
}

func (b *Br) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	instructions = append(instructions, codegen.NewB("."+b.Dest))
	return instructions
}

// <result> = icmp <cond> <ty> <op1>, <op2>
type ICMP struct {
	Dest *LLVMRegister // <result>
	Cond ConditionCode // <cond>
	Ty   types.Type    // <ty>
	Op1  LLVMOperand   // <op1>
	Op2  LLVMOperand   // <op2>
}

func NewICMP(dest *LLVMRegister, cond ConditionCode, ty types.Type, op1 LLVMOperand, op2 LLVMOperand) *ICMP {
	return &ICMP{dest, cond, ty, op1, op2}
}

func (i *ICMP) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(i.Dest.Entry.Name)
	out.WriteString(" = icmp ")
	out.WriteString(i.Cond.String())
	out.WriteString(" ")
	out.WriteString(types.TypeToLLVMString(i.Ty))
	out.WriteString(" ")
	out.WriteString(i.Op1.String())
	out.WriteString(", ")
	out.WriteString(i.Op2.String())
	return out.String()
}

func (i *ICMP) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if i.Dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, i.Dest.Entry)
	}
	if reg := i.Op1.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	if reg := i.Op2.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (i *ICMP) GetType() string {
	return "ICMP"
}

func (i *ICMP) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	// If op1 is a register, check if it is in an ARM register
	op1Instrs, reg1 := TranslateToAssemblyRegHelper(i.Op1, armFunc)
	instructions = append(instructions, op1Instrs...)
	// If op2 is a register, check if it is in an ARM register
	op2Instrs, reg2 := TranslateToAssemblyRegHelper(i.Op2, armFunc)
	instructions = append(instructions, op2Instrs...)
	// Perform the comparison
	armFunc.NextAvailableRegister++ // Unnecessary, but for consistency
	armCmp := codegen.NewCmp(reg1, reg2)
	instructions = append(instructions, armCmp)
	// Prepare a register for the destination
	destReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
	armFunc.NextAvailableRegister++
	// Perform the cset
	csetInstr := codegen.NewCset(destReg, i.Cond.ToARM())
	instructions = append(instructions, csetInstr)
	// Store the result in the dest
	if i.Dest.Entry.Scope == st.GLOBAL {
		nextReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		armAdrp := codegen.NewAdrp(nextReg, i.Dest.Entry.Name)
		instructions = append(instructions, armAdrp)
		armAddLo12 := codegen.NewAddLo12(nextReg, i.Dest.Entry.Name)
		instructions = append(instructions, armAddLo12)
		armStr := codegen.NewStr(destReg, nextReg)
		instructions = append(instructions, armStr)
	} else {
		if armFunc.VarLocations[i.Dest.Entry].GetRegister() != nil {
			armMov := codegen.NewMov(armFunc.VarLocations[i.Dest.Entry].GetRegister(), destReg)
			instructions = append(instructions, armMov)
		} else {
			armStr := codegen.NewStr(destReg, armFunc.VarLocations[i.Dest.Entry])
			instructions = append(instructions, armStr)
		}
	}
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// ret <ty> <value>
type Ret struct {
	ty    types.Type
	value LLVMOperand
}

func NewRet(ty types.Type, value LLVMOperand) *Ret {
	return &Ret{ty, value}
}

func (r *Ret) String() string {
	var out bytes.Buffer
	out.WriteString("ret ")
	out.WriteString(types.TypeToLLVMString(r.ty))
	out.WriteString(" ")
	out.WriteString(r.value.String())
	return out.String()
}

func (r *Ret) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if reg := r.value.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
		vars = append(vars, reg.Entry)
	}
	return vars
}

func (r *Ret) GetType() string {
	return "Ret"
}

func (r *Ret) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Check if the return value is a register
	if reg := r.value.GetRegister(); reg != nil {
		// If the return value is a register, check if it is in an ARM register
		if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
			// If the return value is already in an ARM register, use mov to place it in x0
			instructions = append(instructions, codegen.NewMov(codegen.NewARMRegister("x0"), armOp.GetRegister()))
		} else {
			// If the return value is not already in an ARM register, load it into x0
			instructions = append(instructions, codegen.NewLdr(codegen.NewARMRegister("x0"), armFunc.VarLocations[reg.Entry]))
		}
	} else {
		// If the return value is an immediate, use mov to place it in x0
		instructions = append(instructions, codegen.NewMov(codegen.NewARMRegister("x0"), codegen.NewARMImmediate(r.value.GetImmediate().value)))
	}
	// Return
	instructions = append(instructions, codegen.NewB("."+armFunc.Name+"Exit"))
	return instructions
}

// call <ret_ty> @FUNC_NAME( <ty1> %PARAM_NAME1, <ty2> @PARAM_NAME2, <ty2> @PARAM_NAME3, ... , <tyN> @PARAM_NAMEN)
type Call struct {
	retTy    types.Type
	funcName string
	paramTys []types.Type
	params   []LLVMOperand
}

func NewCall(retTy types.Type, funcName string, paramTys []types.Type, params []LLVMOperand) *Call {
	return &Call{retTy, funcName, paramTys, params}
}

func (c *Call) String() string {
	var out bytes.Buffer
	out.WriteString("call ")
	out.WriteString(types.TypeToLLVMString(c.retTy))
	out.WriteString(" @")
	out.WriteString(c.funcName)
	out.WriteString("(")
	for i, paramTy := range c.paramTys {
		out.WriteString(types.TypeToLLVMString(paramTy))
		out.WriteString(" ")
		out.WriteString(c.params[i].String())
		if i < len(c.paramTys)-1 {
			out.WriteString(", ")
		}
	}
	out.WriteString(")")
	return out.String()
}

func (c *Call) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	for _, param := range c.params {
		if reg := param.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
			vars = append(vars, reg.Entry)
		}
	}
	return vars
}

func (c *Call) GetType() string {
	return "Call"
}

func (c *Call) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Save the caller registers x0-x15 to their backup addresses
	for i := 0; i <= 15; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	// Save the callee registers x19-x28 to their backup addresses
	for i := 19; i <= 28; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	// Prepare parameters by loading into registers x0-x7
	for i, param := range c.params {
		if i < 8 {
			if reg := param.GetRegister(); reg != nil {
				// The parameter is an LLVMRegister
				if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
					// The parameter is already in an ARMRegister
					instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i), armFunc.VarLocations[reg.Entry].GetRegister()))
				} else {
					// The parameter must be loaded into an ARMRegister
					instructions = append(instructions, codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.VarLocations[reg.Entry]))
				}
			} else {
				// The parameter is an immediate
				instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i), codegen.NewARMImmediate(param.GetImmediate().value)))
			}
		} else {
			break
		}
	}
	// Allocate space on the stack for the rest of the parameters
	stackOffset := max(len(c.params)-8, 0) * 8
	if stackOffset%16 != 0 {
		stackOffset += 8
	}
	instructions = append(instructions, codegen.NewSubImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(stackOffset)))
	// If there are more than 8 parameters, load the rest onto the stack
	if len(c.params) >= 8 {
		for i, param := range c.params[8:] {
			// The parameter is on the stack
			if reg := param.GetRegister(); reg != nil {
				// The parameter is an LLVMRegister
				if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
					// The parameter is already in an ARMRegister
					newStr := codegen.NewStr(armFunc.VarLocations[reg.Entry].GetRegister(), codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
					instructions = append(instructions, newStr)
				} else {
					// The parameter must be loaded into an ARMRegister
					tempReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
					newLdr := codegen.NewLdr(tempReg, armFunc.VarLocations[reg.Entry])
					instructions = append(instructions, newLdr)
					newStr := codegen.NewStr(tempReg, codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
					instructions = append(instructions, newStr)
				}
			} else {
				// The parameter is an immediate
				tempReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
				newMov := codegen.NewMov(tempReg, codegen.NewARMImmediate(param.GetImmediate().value))
				instructions = append(instructions, newMov)
				newStr := codegen.NewStr(tempReg, codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
				instructions = append(instructions, newStr)
			}
		}
	}
	// Call the function
	instructions = append(instructions, codegen.NewBl(c.funcName))
	// Deallocate the space on the stack
	instructions = append(instructions, codegen.NewAddImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(stackOffset)))
	// Restore the caller registers x0-x15 from their backup addresses
	for i := 0; i <= 15; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	// Restore the callee registers x19-x28 from their backup addresses
	for i := 19; i <= 28; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	return instructions
}

// call i8 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* @PARAM_NAME)
type Scanf struct {
	param *st.VarEntry
}

func NewScanf(param *st.VarEntry) *Scanf {
	return &Scanf{param}
}

func (s *Scanf) String() string {
	var out bytes.Buffer
	out.WriteString("call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0),i64* ")
	if s.param.Scope == st.GLOBAL {
		out.WriteString("@")
	} else {
		out.WriteString("%")
	}
	out.WriteString(s.param.Name)
	out.WriteString(")")
	return out.String()
}

func (s *Scanf) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if s.param.Scope != st.GLOBAL {
		vars = append(vars, s.param)
	}
	return vars
}

func (s *Scanf) GetType() string {
	return "Scanf"
}

func (s *Scanf) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Prepare the parameter by loading into a register
	readReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
	adrpInstr := codegen.NewAdrp(readReg, ".READ")
	instructions = append(instructions, adrpInstr)
	addLo12Instr := codegen.NewAddLo12(readReg, ".READ")
	instructions = append(instructions, addLo12Instr)
	movInstr := codegen.NewMov(codegen.NewARMRegister("x0"), readReg)
	instructions = append(instructions, movInstr)
	// If the parameter is a global variable, load it into a register
	if s.param.Scope == st.GLOBAL {
		nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
		armFunc.NextAvailableRegister++
		adrpInstr := codegen.NewAdrp(nextArmReg, s.param.Name)
		addLo12Instr := codegen.NewAddLo12(nextArmReg, s.param.Name)
		ldrInstr := codegen.NewLdr(nextArmReg, nextArmReg)
		instructions = append(instructions, adrpInstr, addLo12Instr, ldrInstr)
		instructions = append(instructions, codegen.NewMov(codegen.NewARMRegister("x1"), nextArmReg))
	} else {
		// The parameter is an LLVMRegister
		if armOp := armFunc.VarLocations[s.param]; armOp.GetRegister() != nil {
			// The parameter is already in an ARMRegister
			// Allocate 8 bytes on the stack for the input
			instructions = append(instructions, codegen.NewSubImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(16)))
			instructions = append(instructions, codegen.NewMov(codegen.NewARMRegister("x1"), codegen.NewARMRegister("sp")))
			instructions = append(instructions, SaveRegs(armFunc)...)
			instructions = append(instructions, codegen.NewBl("scanf"))
			instructions = append(instructions, RestoreRegs(armFunc)...)
			// Store the input into the parameter
			instructions = append(instructions, codegen.NewLdr(armOp.GetRegister(), codegen.NewARMRegister("sp")))
			// Deallocate the 8 bytes on the stack
			instructions = append(instructions, codegen.NewAddImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(16)))
			return instructions
		} else {
			// The parameter must be loaded into an ARMRegister
			if armOp.GetAddress() != nil {
				// The parameter is an address
				instructions = append(instructions, codegen.NewAddImm(codegen.NewARMRegister("x1"), armOp.GetAddress().Base, armOp.GetAddress().Offset[0]))
			}
		}
	}
	instructions = append(instructions, SaveRegs(armFunc)...)
	blInstr := codegen.NewBl("scanf")
	instructions = append(instructions, blInstr)
	instructions = append(instructions, RestoreRegs(armFunc)...)

	return instructions
}

// call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @globalString, i32 0, i32 0),i64 <flag1>,i64 <flag2>, ...)
type Printf struct {
	Strlit   string
	StrIndex int
	Flags    []LLVMOperand
}

func NewPrintf(strlit string, strIndex int, flags []LLVMOperand) *Printf {
	return &Printf{strlit, strIndex, flags}
}

func (p *Printf) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	for _, flag := range p.Flags {
		if reg := flag.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
			vars = append(vars, reg.Entry)
		}
	}
	return vars
}

func (p *Printf) String() string {
	var out bytes.Buffer
	out.WriteString("call i8 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.fstr")
	out.WriteString(strconv.Itoa(p.StrIndex))
	out.WriteString(", i32 0, i32 0)")
	for _, flag := range p.Flags {
		out.WriteString(",")
		out.WriteString("i64 ")
		out.WriteString(flag.String())
	}
	out.WriteString(")")
	return out.String()
}

func (p *Printf) GetType() string {
	return "Printf"
}

func formatString(s string) (string, int) {
	var globalString bytes.Buffer
	i := 1
	strLen := len(s) - 2
	for i < len(s)-1 {
		switch c := s[i]; c {
		case '%':
			if i+1 < len(s) && s[i+1] == 'd' {
				globalString.WriteString(`%ld`)
				i++
				strLen++
			} else {
				globalString.WriteString(`%`)
			}
		default:
			globalString.WriteByte(c)
		}
		i++
	}
	strLen--
	return globalString.String(), strLen
}

func (p *Printf) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	// Prepare parameters by loading into registers x0-x8
	formattedString, strLen := formatString(p.Strlit)
	armFunc.FmtStrs = append(armFunc.FmtStrs, formattedString)
	armFunc.FmtStrLengths = append(armFunc.FmtStrLengths, strLen)
	fmtstr := ".FMTSTR" + strconv.Itoa(p.StrIndex)
	fmtstrReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
	adrpInstr := codegen.NewAdrp(fmtstrReg, fmtstr)
	instructions = append(instructions, adrpInstr)
	addLo12Instr := codegen.NewAddLo12(fmtstrReg, fmtstr)
	instructions = append(instructions, addLo12Instr)
	movInstr := codegen.NewMov(codegen.NewARMRegister("x0"), fmtstrReg)
	instructions = append(instructions, movInstr)
	for i, flag := range p.Flags {
		if reg := flag.GetRegister(); reg != nil {
			if reg.Entry.Scope == st.GLOBAL {
				// The flag is a global variable
				nextArmReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
				armFunc.NextAvailableRegister++
				adrpInstr := codegen.NewAdrp(nextArmReg, reg.Entry.Name)
				addLo12Instr := codegen.NewAddLo12(nextArmReg, reg.Entry.Name)
				ldrInstr := codegen.NewLdr(nextArmReg, nextArmReg)
				instructions = append(instructions, adrpInstr, addLo12Instr, ldrInstr)
				instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i+1), nextArmReg))
			} else {
				// The flag is an LLVMRegister
				if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
					// The flag is already in an ARMRegister
					instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i+1), armOp.GetRegister()))
				} else {
					// The flag is not in an ARMRegister
					instructions = append(instructions, codegen.NewLdr(codegen.NewARMRegFromInt(i+1), armOp))
				}
			}
		} else {
			// The flag is an immediate
			instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i+1), codegen.NewARMImmediate(flag.GetImmediate().value)))
		}
	}
	instructions = append(instructions, SaveRegs(armFunc)...)
	// Call the function
	instructions = append(instructions, codegen.NewBl("printf"))
	instructions = append(instructions, RestoreRegs(armFunc)...)
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// <result> = call <ret_ty> @FUNC_NAME( <ty1> %PARAM_NAME1, <ty2> @PARAM_NAME2, <ty2> @PARAM_NAME3, ... , <tyN> @PARAM_NAMEN)
type CallAssign struct {
	dest     *LLVMRegister // <result>
	retTy    types.Type    // <ret_ty>
	funcName string        // @FUNC_NAME
	paramTys []types.Type  // <ty1>, <ty2>, <ty3>, ... , <tyN>
	params   []LLVMOperand // %PARAM_NAME1, @PARAM_NAME2, @PARAM_NAME3, ... , @PARAM_NAMEN
}

func NewCallAssign(dest *LLVMRegister, retTy types.Type, funcName string, paramTys []types.Type, params []LLVMOperand) *CallAssign {
	return &CallAssign{dest, retTy, funcName, paramTys, params}
}

func (c *CallAssign) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(c.dest.Entry.Name)
	out.WriteString(" = call ")
	out.WriteString(types.TypeToLLVMString(c.retTy))
	out.WriteString(" @")
	out.WriteString(c.funcName)
	out.WriteString("(")
	for i, paramTy := range c.paramTys {
		out.WriteString(types.TypeToLLVMString(paramTy))
		out.WriteString(" ")
		out.WriteString(c.params[i].String())
		if i < len(c.paramTys)-1 {
			out.WriteString(", ")
		}
	}
	out.WriteString(")")
	return out.String()
}

func (c *CallAssign) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if c.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, c.dest.Entry)
	}
	for _, param := range c.params {
		if reg := param.GetRegister(); reg != nil && reg.Entry.Scope != st.GLOBAL {
			vars = append(vars, reg.Entry)
		}
	}
	return vars
}

func (c *CallAssign) GetType() string {
	return "CallAssign"
}

func (c *CallAssign) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	// Save the caller registers x0-x15 to their backup addresses
	for i := 0; i <= 15; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	for i := 19; i <= 28; i++ {
		backupStr := codegen.NewStr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupStr)
	}
	// Prepare parameters by loading into registers x0-x7
	for i, param := range c.params {
		if i < 8 {
			if reg := param.GetRegister(); reg != nil {
				// The parameter is an LLVMRegister
				if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
					// The parameter is already in an ARMRegister
					instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i), armFunc.VarLocations[reg.Entry].GetRegister()))
				} else {
					// The parameter must be loaded into an ARMRegister
					instructions = append(instructions, codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.VarLocations[reg.Entry]))
				}
			} else {
				// The parameter is an immediate
				instructions = append(instructions, codegen.NewMov(codegen.NewARMRegFromInt(i), codegen.NewARMImmediate(param.GetImmediate().value)))
			}
		} else {
			break
		}
	}
	// Allocate space on the stack for the rest of the parameters
	stackOffset := max(len(c.params)-8, 0) * 8
	if stackOffset%16 != 0 {
		stackOffset += 8
	}
	instructions = append(instructions, codegen.NewSubImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(stackOffset)))
	// If there are more than 8 parameters, load the rest onto the stack
	if len(c.params) >= 8 {
		for i, param := range c.params[8:] {
			// The parameter is on the stack
			if reg := param.GetRegister(); reg != nil {
				// The parameter is an LLVMRegister
				if armOp := armFunc.VarLocations[reg.Entry]; armOp.GetRegister() != nil {
					// The parameter is already in an ARMRegister
					newStr := codegen.NewStr(armFunc.VarLocations[reg.Entry].GetRegister(), codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
					instructions = append(instructions, newStr)
				} else {
					// The parameter must be loaded into an ARMRegister
					tempReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
					newLdr := codegen.NewLdr(tempReg, armFunc.VarLocations[reg.Entry])
					instructions = append(instructions, newLdr)
					newStr := codegen.NewStr(tempReg, codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
					instructions = append(instructions, newStr)
				}
			} else {
				// The parameter is an immediate
				tempReg := codegen.NewARMRegFromInt(armFunc.NextAvailableRegister)
				newMov := codegen.NewMov(tempReg, codegen.NewARMImmediate(param.GetImmediate().value))
				instructions = append(instructions, newMov)
				newStr := codegen.NewStr(tempReg, codegen.NewARMAddress(codegen.NewARMRegister("sp"), []*codegen.ARMImmediate{codegen.NewARMImmediate(armFunc.StackSize + i*8 - 16)}))
				instructions = append(instructions, newStr)
			}
		}
	}
	// Call the function
	instructions = append(instructions, codegen.NewBl(c.funcName))
	// Deallocate the space on the stack
	instructions = append(instructions, codegen.NewAddImm(codegen.NewARMRegister("sp"), codegen.NewARMRegister("sp"), codegen.NewARMImmediate(stackOffset)))
	// Store the result in x16
	new_instructions, armReg := GetARMRegFromLLVMReg(c.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	armTempMov := codegen.NewMov(codegen.NewARMRegister("x16"), codegen.NewARMRegister("x0"))
	instructions = append(instructions, armTempMov)
	// Restore the caller registers x0-x15 from their backup addresses
	for i := 0; i <= 15; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	for i := 19; i <= 28; i++ {
		backupLdr := codegen.NewLdr(codegen.NewARMRegister("x"+strconv.Itoa(i)), armFunc.SavedAddresses[i])
		instructions = append(instructions, backupLdr)
	}
	// Retrieve the result from x16 and store it into dest
	armMov := codegen.NewMov(armReg, codegen.NewARMRegister("x16"))
	instructions = append(instructions, armMov)
	return instructions
}

// <result> = call i8* @malloc(i32 <size>)
type Malloc struct {
	dest *LLVMRegister // <result>
	size int           // <size>
}

func NewMalloc(dest *LLVMRegister, size int) *Malloc {
	return &Malloc{dest, size}
}

func (m *Malloc) String() string {
	var out bytes.Buffer
	out.WriteString("%")
	out.WriteString(m.dest.Entry.Name)
	out.WriteString(" = call i8* @malloc(i32 ")
	out.WriteString(strconv.Itoa(m.size))
	out.WriteString(")")
	return out.String()
}

func (m *Malloc) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if m.dest.Entry.Scope != st.GLOBAL {
		vars = append(vars, m.dest.Entry)
	}
	return vars
}

func (m *Malloc) GetType() string {
	return "Malloc"
}

func (m *Malloc) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	m.dest.IsPtr = true
	// Load the size into x0
	instructions = append(instructions, codegen.NewMov(codegen.NewARMRegister("x0"), codegen.NewARMImmediate(m.size)))
	// Call the function
	instructions = append(instructions, codegen.NewBl("malloc"))
	// Store the result in the dest
	new_instructions, armOp := GetARMOpFromLLVMReg(m.dest, armFunc)
	instructions = append(instructions, new_instructions...)
	if armOp.GetRegister() != nil {
		armMov := codegen.NewMov(armOp.GetRegister(), codegen.NewARMRegister("x0"))
		instructions = append(instructions, armMov)
	} else {
		armStr := codegen.NewStr(codegen.NewARMRegister("x0"), armOp)
		instructions = append(instructions, armStr)
	}
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	return instructions
}

// call void @free(i8* <ptr>)
type Free struct {
	ptr *LLVMRegister // <ptr>
}

func NewFree(ptr *LLVMRegister) *Free {
	return &Free{ptr}
}

func (f *Free) String() string {
	var out bytes.Buffer
	out.WriteString("call void @free(i8* ")
	out.WriteString(f.ptr.String())
	out.WriteString(")")
	return out.String()
}

func (f *Free) Vars() []*st.VarEntry {
	var vars []*st.VarEntry
	if f.ptr.Entry.Scope != st.GLOBAL {
		vars = append(vars, f.ptr.Entry)
	}
	return vars
}

func (f *Free) GetType() string {
	return "Free"
}

func (f *Free) TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction {
	var instructions []codegen.Instruction
	resetVal := armFunc.NextAvailableRegister
	// Load the pointer into x0
	new_instructions, armReg := GetARMRegFromLLVMReg(f.ptr, armFunc)
	instructions = append(instructions, new_instructions...)
	armMov := codegen.NewMov(codegen.NewARMRegister("x0"), armReg)
	instructions = append(instructions, armMov)
	// Call the function
	instructions = append(instructions, codegen.NewBl("free"))
	// Reset the next available register
	armFunc.NextAvailableRegister = resetVal
	return instructions
}
