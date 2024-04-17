package ast

import (
	"fmt"
	"proj-optimization-overlords/cfg"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type StringLiteral struct {
	*token.Token
	Value Expression
}

func NewStringLit(value Expression, token *token.Token) *StringLiteral {
	return &StringLiteral{token, value}
}

func (sl *StringLiteral) String() string {
	return fmt.Sprintf("%v", sl.Value)
}

func (sl *StringLiteral) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return types.StringTySig
}

func (sl *StringLiteral) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	return nil, nil
}
