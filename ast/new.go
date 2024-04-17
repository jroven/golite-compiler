package ast

import (
	"bytes"
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type New struct {
	*token.Token
	id *Variable
}

func NewNewStm(id *Variable, token *token.Token) *New {
	return &New{token, id}
}

func (n *New) String() string {
	var out bytes.Buffer

	out.WriteString("new ")        // NEW
	out.WriteString(n.id.String()) // lvalue

	return out.String()
}

func (n *New) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	// Return struct type
	return types.NewStructTy(n.id.Identifier)
}

func (n *New) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// Check if the variable is a struct
	if tables.Structs.Contains(n.id.Identifier) == nil {
		errors = append(errors, ct.NewCompilerError(n.Token, "new expects expression of type struct but found undefined \""+
			n.id.Identifier+"\" type.", ct.SEMANTIC))
	}
	return errors
}

func (n *New) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	var instructions []cfg.Instruction
	structEntry := program.Tables.Structs.Contains(n.id.Identifier)
	bytesToAlloc := len(structEntry.Offsets) * 8
	mallocRegName := program.RegisterGen()
	mallocEntry := st.NewVarEntry(mallocRegName, types.NewStructTy(n.id.Identifier), st.LOCAL, n.Token)
	currFunc.Variables.Insert(mallocRegName, mallocEntry)
	mallocInstr := llvm.NewMalloc(llvm.NewLLVMRegister(mallocEntry), bytesToAlloc)
	bitcastRegName := program.RegisterGen()
	bitcastEntry := st.NewVarEntry(bitcastRegName, types.NewStructTy(n.id.Identifier), st.LOCAL, n.Token)
	currFunc.Variables.Insert(bitcastRegName, bitcastEntry)
	bitcastInstr := llvm.NewBitcast(llvm.NewLLVMRegister(bitcastEntry), types.NewPointerTy(types.Int8Sig),
		llvm.NewLLVMRegister(mallocEntry), types.NewStructTy(n.id.Identifier))
	instructions = append(instructions, mallocInstr, bitcastInstr)
	return instructions, llvm.NewLLVMRegister(bitcastEntry)
}
