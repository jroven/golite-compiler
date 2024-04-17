package ast

import (
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type Nil struct {
	*token.Token
}

func NewNil(token *token.Token) *Nil {
	return &Nil{token}
}

func (nl *Nil) String() string {
	return "nil"
}

func (nl *Nil) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return types.NilTySig
}

func (nl *Nil) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	return errors
}

func (nl *Nil) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	return nil, llvm.NewLLVMImmediate(0, types.NilTySig)
}
