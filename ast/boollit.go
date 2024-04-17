package ast

import (
	"fmt"
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type BoolLiteral struct {
	*token.Token
	Value bool
}

func NewBoolLit(value bool, token *token.Token) *BoolLiteral {
	return &BoolLiteral{token, value}
}

func (bl *BoolLiteral) String() string {
	return fmt.Sprintf("%v", bl.Value)
}

func (bl *BoolLiteral) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return types.BoolTySig
}

func (bl *BoolLiteral) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	return errors
}

func (bl *BoolLiteral) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	if bl.Value {
		return nil, llvm.NewLLVMImmediate(1, types.BoolTySig)
	}
	return nil, llvm.NewLLVMImmediate(0, types.BoolTySig)
}
