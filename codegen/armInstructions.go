package codegen

type Instruction interface {
	String() string
	GetType() string
}

// <label>:
type Label struct {
	Name string
}

func NewLabel(name string) *Label {
	return &Label{name}
}

func (l *Label) String() string {
	return l.Name + ":"
}

func (l *Label) GetType() string {
	return "Label"
}

// str <reg>, [addr]
type Str struct {
	Reg  *ARMRegister
	Addr ARMOperand
}

func NewStr(reg *ARMRegister, addr ARMOperand) *Str {
	return &Str{reg, addr}
}

func (str *Str) String() string {
	return "str " + str.Reg.String() + ", [" + str.Addr.String() + "]"
}

func (str *Str) GetType() string {
	return "Str"
}

// ldr <reg>, [addr]
type Ldr struct {
	Reg *ARMRegister
	Op  ARMOperand
}

func NewLdr(reg *ARMRegister, op ARMOperand) *Ldr {
	return &Ldr{reg, op}
}

func (ldr *Ldr) String() string {
	return "ldr " + ldr.Reg.String() + ", [" + ldr.Op.String() + "]"
}

func (ldr *Ldr) GetType() string {
	return "Ldr"
}

// mov <reg>, <operand>
type Mov struct {
	Reg     *ARMRegister
	Operand ARMOperand
}

func NewMov(reg *ARMRegister, operand ARMOperand) *Mov {
	return &Mov{reg, operand}
}

func (mov *Mov) String() string {
	return "mov " + mov.Reg.String() + ", " + mov.Operand.String()
}

func (mov *Mov) GetType() string {
	return "Mov"
}

// bl <func_name>
type Bl struct {
	FuncName string
}

func NewBl(FuncName string) *Bl {
	return &Bl{FuncName}
}

func (bl *Bl) String() string {
	return "bl " + bl.FuncName
}

func (bl *Bl) GetType() string {
	return "Bl"
}

// <operator> <dest> <reg1> <reg2>
type ARMBinOp struct {
	Operator ARMBinOpTy
	Dest     *ARMRegister
	Reg1     *ARMRegister
	Reg2     *ARMRegister
}

func NewARMBinOp(operator ARMBinOpTy, dest *ARMRegister, reg1 *ARMRegister, reg2 *ARMRegister) *ARMBinOp {
	return &ARMBinOp{operator, dest, reg1, reg2}
}

func (binOp *ARMBinOp) String() string {
	return binOp.Operator.String() + " " + binOp.Dest.String() + ", " + binOp.Reg1.String() + ", " + binOp.Reg2.String()
}

func (binOp *ARMBinOp) GetType() string {
	return "ARMBinOp"
}

// adrp <target_reg>, <global_var_name>
type Adrp struct {
	TargetReg *ARMRegister
	GlobalVar string
}

func NewAdrp(targetReg *ARMRegister, globalVar string) *Adrp {
	return &Adrp{targetReg, globalVar}
}

func (adrp *Adrp) String() string {
	return "adrp " + adrp.TargetReg.String() + ", " + adrp.GlobalVar
}

func (adrp *Adrp) GetType() string {
	return "Adrp"
}

// add <target_reg>, <target_reg>, :lo12:<global_var_name>
type AddLo12 struct {
	TargetReg *ARMRegister
	GlobalVar string
}

func NewAddLo12(targetReg *ARMRegister, globalVar string) *AddLo12 {
	return &AddLo12{targetReg, globalVar}
}

func (addLo12 *AddLo12) String() string {
	return "add " + addLo12.TargetReg.String() + ", " + addLo12.TargetReg.String() + ", :lo12:" + addLo12.GlobalVar
}

func (addLo12 *AddLo12) GetType() string {
	return "AddLo12"
}

// ret
type Ret struct{}

func NewRet() *Ret {
	return &Ret{}
}

func (ret *Ret) String() string {
	return "ret"
}

func (ret *Ret) GetType() string {
	return "Ret"
}

// add <reg>, [addr]
type Add struct {
	Reg *ARMRegister
	Op  ARMOperand
}

func NewAdd(reg *ARMRegister, op ARMOperand) *Add {
	return &Add{reg, op}
}

func (add *Add) String() string {
	return "add " + add.Reg.String() + ", " + add.Op.String()
}

func (add *Add) GetType() string {
	return "Add"
}

// b <label>
type B struct {
	Label string
}

func NewB(label string) *B {
	return &B{label}
}

func (b *B) String() string {
	return "b " + b.Label
}

func (b *B) GetType() string {
	return "B"
}

// cmp <op1>, <op2>
type Cmp struct {
	Op1 ARMOperand
	Op2 ARMOperand
}

func NewCmp(op1 ARMOperand, op2 ARMOperand) *Cmp {
	return &Cmp{op1, op2}
}

func (cmp *Cmp) String() string {
	return "cmp " + cmp.Op1.String() + ", " + cmp.Op2.String()
}

func (cmp *Cmp) GetType() string {
	return "Cmp"
}

// b.<cond> <label>
type BCond struct {
	Cond  ConditionCode
	Label string
}

func NewBCond(cond ConditionCode, label string) *BCond {
	return &BCond{cond, label}
}

func (bCond *BCond) String() string {
	return "b." + bCond.Cond.String() + " " + bCond.Label
}

func (bCond *BCond) GetType() string {
	return "BCond"
}

// add <dest_reg>, <ptr_ref>, <imm>
type AddImm struct {
	Reg *ARMRegister
	Ptr *ARMRegister
	Imm *ARMImmediate
}

func NewAddImm(reg *ARMRegister, ptr *ARMRegister, imm *ARMImmediate) *AddImm {
	return &AddImm{reg, ptr, imm}
}

func (addImm *AddImm) String() string {
	return "add " + addImm.Reg.String() + ", " + addImm.Ptr.String() + ", " + addImm.Imm.String()
}

func (addImm *AddImm) GetType() string {
	return "AddImm"
}

// cset <dest> <cond>
type Cset struct {
	Dest *ARMRegister
	Cond ConditionCode
}

func NewCset(dest *ARMRegister, cond ConditionCode) *Cset {
	return &Cset{dest, cond}
}

func (cset *Cset) String() string {
	return "cset " + cset.Dest.String() + ", " + cset.Cond.String()
}

func (cset *Cset) GetType() string {
	return "Cset"
}

// sub <dest_reg>, <ptr_ref>, <imm>
type SubImm struct {
	Reg *ARMRegister
	Ptr *ARMRegister
	Imm *ARMImmediate
}

func NewSubImm(reg *ARMRegister, ptr *ARMRegister, imm *ARMImmediate) *SubImm {
	return &SubImm{reg, ptr, imm}
}

func (subImm *SubImm) String() string {
	return "sub " + subImm.Reg.String() + ", " + subImm.Ptr.String() + ", " + subImm.Imm.String()
}

func (subImm *SubImm) GetType() string {
	return "SubImm"
}
