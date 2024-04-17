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

type IntLiteral struct {
	*token.Token
	Value int64
}

func NewIntLit(value int64, token *token.Token) *IntLiteral {
	return &IntLiteral{token, value}
}

func (il *IntLiteral) String() string {
	return fmt.Sprintf("%v", il.Value)
}

func (il *IntLiteral) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return types.IntTySig
}

func (il *IntLiteral) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	return errors
}

func (il *IntLiteral) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	return nil, llvm.NewLLVMImmediate(int(il.Value), types.IntTySig)
}
