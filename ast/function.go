package ast

import (
	"bytes"
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
	"strconv"
)

type Function struct {
	*token.Token
	id           *Variable
	params       []*Decl
	returnType   []*ReturnType // maximum length 1
	declarations []*Declaration
	stms         []Statement
}

func NewFunctionStm(id *Variable, params []*Decl, returnType []*ReturnType,
	declarations []*Declaration, stms []Statement,
	token *token.Token) *Function {
	return &Function{token, id, params, returnType, declarations, stms}
}

func (f *Function) String() string {
	var out bytes.Buffer

	out.WriteString("func ")       // FUNC
	out.WriteString(f.id.String()) // id
	out.WriteString("(")           // LPAREN
	for i, param := range f.params {
		out.WriteString(param.String()) // params
		if i < len(f.params)-1 {
			out.WriteString(", ") // COMMA
		}
	}
	out.WriteString(") ") // RPAREN
	if len(f.returnType) == 1 {
		out.WriteString(f.returnType[0].String()) // ReturnType
		out.WriteString(" ")
	}
	out.WriteString("{\n") // LBRACE
	for _, declaration := range f.declarations {
		out.WriteString(declaration.String()) // declarations
		out.WriteString("\n")
	}
	for _, statement := range f.stms {
		out.WriteString(statement.String()) // statements
		out.WriteString("\n")
	}
	out.WriteString("}") // RBRACE

	return out.String()
}

func (f *Function) BuildSymbolTable(errors []*ct.CompilerError, tables *st.SymbolTables) []*ct.CompilerError {
	// Check that function with same name has not been declared
	if entry := tables.Funcs.Contains(f.id.Identifier); entry != nil {
		errors = append(errors, ct.NewCompilerError(token.NewToken(f.Token.Line, f.Token.Column),
			"function with name \""+f.id.Identifier+"\" already defined. Previous declaration at "+
				strconv.Itoa(entry.Token.Line)+":"+strconv.Itoa(entry.Token.Column), ct.SEMANTIC))
	}
	entry := st.NewFuncEntry(f.id.Identifier, nil, f.Token)
	if len(f.returnType) != 0 {
		entry = st.NewFuncEntry(f.id.Identifier, f.returnType[0].ty.Ty, f.Token)
	}
	tables.Funcs.Insert(f.id.Identifier, entry)
	entry.Variables = st.NewSymbolTable(tables.Globals)
	for _, param := range f.params {
		paramEntry := st.NewVarEntry(param.id.Identifier, param.ty.Ty, st.PARAM, param.Token)
		entry.Parameters = append(entry.Parameters, paramEntry)
		entry.Variables.Insert(param.id.Identifier, paramEntry)
	}
	for _, declaration := range f.declarations {
		errors = declaration.BuildSymbolTable(errors, entry.Variables)
	}
	return errors
}

func (f *Function) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	for _, declaration := range f.declarations {
		errors = declaration.TypeCheck(errors, function, tables)
	}
	function = tables.Funcs.Contains(f.id.Identifier)
	for _, statement := range f.stms {
		errors = statement.TypeCheck(errors, function, tables)
	}
	return errors
}

func (f *Function) ReturnCheck() *ct.CompilerError {
	if len(f.returnType) == 0 {
		return nil
	}
	return f.ReturnCheckHelper(len(f.stms))
}

func (f *Function) ReturnCheckHelper(stmIndex int) *ct.CompilerError {
	if stmIndex == 0 {
		var msg bytes.Buffer
		msg.WriteString("Not all possible control flow paths in \"")
		msg.WriteString(f.id.Identifier)
		msg.WriteString("\" return.")
		return ct.NewCompilerError(f.Token, msg.String(), ct.SEMANTIC)
	}
	if f.stms[stmIndex-1].ReturnCheck() {
		return nil
	}
	return f.ReturnCheckHelper(stmIndex - 1)
}

func (f *Function) TranslateToLLVMStack(target string, tables *st.SymbolTables, llvmProg *llvm.LLVMProgram) *llvm.LLVMFuncDef {
	var retTy []types.Type
	var retInstr cfg.Instruction
	firstBlock := cfg.NewBlock(llvmProg.LabelGen)
	var retEntry *st.VarEntry
	var retReg *llvm.LLVMRegister
	if len(f.returnType) > 0 {
		retTy = append(retTy, f.returnType[0].ty.Ty)
		retEntry = st.NewVarEntry("_ret_val", f.returnType[0].ty.Ty, st.LOCAL, f.Token)
		tables.Funcs.Contains(f.id.Identifier).Variables.Insert("_ret_val", retEntry)
		retInstr = llvm.NewAlloca(f.returnType[0].ty.Ty, llvm.NewLLVMRegister(retEntry))
	} else {
		retEntry = st.NewVarEntry("_ret_val", types.Int64Sig, st.LOCAL, f.Token)
		tables.Funcs.Contains(f.id.Identifier).Variables.Insert("_ret_val", retEntry)
		retReg = llvm.NewLLVMRegister(retEntry)
		retInstr = llvm.NewAlloca(types.Int64Sig, retReg)
	}
	var paramTys []types.Type
	var paramNames []string
	var paramInstrs []cfg.Instruction
	for _, param := range f.params {
		paramTys = append(paramTys, param.ty.Ty)
		paramNames = append(paramNames, param.id.Identifier)
	}
	paramEntries := tables.Funcs.Contains(f.id.Identifier).Parameters
	for _, entry := range paramEntries {
		paramEntry := st.NewVarEntry("_P_"+entry.Name, entry.Ty, st.PARAM, f.Token)
		tables.Funcs.Contains(f.id.Identifier).Variables.Insert("_P_"+entry.Name, paramEntry)
		paramInstrs = append(paramInstrs, llvm.NewAlloca(entry.Ty, llvm.NewLLVMRegister(paramEntry)))
		paramInstrs = append(paramInstrs, llvm.NewStore(entry.Ty, llvm.NewLLVMRegister(entry), llvm.NewLLVMRegister(paramEntry)))
	}
	llvmFunc := llvm.NewLLVMFuncDef(retTy, f.id.Identifier, paramTys, paramNames, map[string]*cfg.Block{}, map[string]*cfg.Block{}, firstBlock)
	llvmProg.AddFuncDef(llvmFunc)
	llvmFunc.AddBlock(firstBlock.Label, firstBlock)
	funcEntry := tables.Funcs.Contains(f.id.Identifier)
	firstBlock.AddInstr(retInstr)
	firstBlock.AddInstructions(paramInstrs)
	for _, declaration := range f.declarations {
		for _, instr := range declaration.LocalTranslateToLLVMStack(target, tables, llvmProg) {
			firstBlock.AddInstr(instr)
		}
	}
	currentBlock := firstBlock
	for _, stm := range f.stms {
		currentBlock = stm.TranslateToLLVMStack(currentBlock, funcEntry, llvmProg)
	}
	if len(f.returnType) == 0 {
		endRetInstr := llvm.NewStore(types.Int64Sig, llvm.NewLLVMImmediate(0, types.Int64Sig), llvm.NewLLVMRegister(retEntry))
		currentBlock.AddInstr(endRetInstr)
		retRegName := llvmProg.RegisterGen()
		retRegVar := st.NewVarEntry(retRegName, types.Int64Sig, st.LOCAL, f.Token)
		reg := llvm.NewLLVMRegister(retRegVar)
		funcEntry.Variables.Insert(retRegName, retRegVar)
		load := llvm.NewLoad(types.Int64Sig, reg, retReg)
		currentBlock.AddInstr(load)
		retInstr = llvm.NewRet(types.Int64Sig, reg)
		currentBlock.AddInstr(retInstr)
	}
	if llvmProg.Optimize {
		for _, b := range llvmFunc.Blocks {
			for i, instr := range b.Instrs {
				if (instr.GetType() == "Ret" || instr.GetType() == "Br" || instr.GetType() == "BrCond") && i != len(b.Instrs)-1 {
					b.Instrs = b.Instrs[:i+1]
					break
				}
			}
		}
		for i := 0; i < 5; i++ {
			seenBlocks := make(map[string]bool)
			seenBlocks[firstBlock.Label] = true
			for _, b := range llvmFunc.Blocks {
				for _, instr := range b.Instrs {
					if instr.GetType() == "Br" {
						brInstr := instr.(*llvm.Br)
						if brInstr.Dest != b.Label {
							seenBlocks[brInstr.Dest] = true
						}
					} else if instr.GetType() == "BrCond" {
						brCondInstr := instr.(*llvm.BrCond)
						seenBlocks[brCondInstr.Iftrue] = true
						seenBlocks[brCondInstr.Iffalse] = true
					}
				}
			}
			for _, b := range llvmFunc.Blocks {
				if ok := seenBlocks[b.Label]; !ok {
					llvmFunc.RemoveBlock(b.Label)
				}
			}
		}
	} else {
		for _, b := range llvmFunc.Blocks {
			if len(b.Instrs) == 0 {
				b.AddInstr(llvm.NewBr(b.Label))
			}
		}
	}
	return llvmFunc
}
