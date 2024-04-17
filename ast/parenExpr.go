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

type ParenExpr struct {
	*token.Token
	expr Expression
}

func NewParenExpr(expr Expression, token *token.Token) *ParenExpr {
	return &ParenExpr{token, expr}
}

func (pe *ParenExpr) String() string {
	var out bytes.Buffer

	out.WriteString("(")              // LPAREN
	out.WriteString(pe.expr.String()) // Expression
	out.WriteString(")")              // RPAREN

	return out.String()
}

func (pe *ParenExpr) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return pe.expr.GetType(function, tables)
}

func (pe *ParenExpr) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	errors = pe.expr.TypeCheck(errors, function, tables)
	return errors
}

func (pe *ParenExpr) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	return pe.expr.ExprTranslateToLLVMStack(currFunc, program)
}
