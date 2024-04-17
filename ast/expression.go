package ast

import (
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/types"
)

type Operator int

const (
	PLUS Operator = iota
	MINUS
	ASTERISK
	FSLASH
	GT
	GTE
	LT
	LTE
	EQ
	NEQ
	NOT
	AND
	OR
)

func StrToOp(op string) Operator {
	switch op {
	case "+":
		return PLUS
	case "-":
		return MINUS
	case "*":
		return ASTERISK
	case "/":
		return FSLASH
	case ">":
		return GT
	case ">=":
		return GTE
	case "<":
		return LT
	case "<=":
		return LTE
	case "==":
		return EQ
	case "!=":
		return NEQ
	case "!":
		return NOT
	case "&&":
		return AND
	case "||":
		return OR
	}
	panic("Error: Could not determine operator")
}

func (op Operator) String() string {
	switch op {
	case PLUS:
		return "+"
	case MINUS:
		return "-"
	case ASTERISK:
		return "*"
	case FSLASH:
		return "/"
	case GT:
		return ">"
	case GTE:
		return ">="
	case LT:
		return "<"
	case LTE:
		return "<="
	case EQ:
		return "=="
	case NEQ:
		return "!="
	case NOT:
		return "!"
	case AND:
		return "&&"
	case OR:
		return "||"
	}
	panic("Error: Could not determine operator")
}

func (op Operator) IsComparison() bool {
	switch op {
	case GT, GTE, LT, LTE, EQ, NEQ:
		return true
	}
	return false
}

func (op Operator) IsBoolOp() bool {
	switch op {
	case AND, OR:
		return true
	}
	return false
}

func (op Operator) ToLLVMBinOpTy() llvm.BinOpTy {
	switch op {
	case PLUS:
		return llvm.ADD
	case MINUS:
		return llvm.SUB
	case ASTERISK:
		return llvm.MUL
	case FSLASH:
		return llvm.SDIV
	case AND:
		return llvm.AND
	case OR:
		return llvm.OR
	}
	panic("Error: Could not determine operator")
}

func (op Operator) ToLLVMCondCode() llvm.ConditionCode {
	switch op {
	case GT:
		return llvm.SGT
	case GTE:
		return llvm.SGE
	case LT:
		return llvm.SLT
	case LTE:
		return llvm.SLE
	case EQ:
		return llvm.EQ
	case NEQ:
		return llvm.NE
	}
	panic("Error: Could not determine operator")

}

func opString(op Operator) string {
	switch op {
	case PLUS:
		return "+"
	case MINUS:
		return "-"
	case ASTERISK:
		return "*"
	case FSLASH:
		return "/"
	case GT:
		return ">"
	case GTE:
		return ">="
	case LT:
		return "<"
	case LTE:
		return "<="
	case EQ:
		return "=="
	case NEQ:
		return "!="
	case NOT:
		return "!"
	case AND:
		return "&&"
	case OR:
		return "||"
	}
	panic("Error: Could not determine operator")
}

type Expression interface {
	String() string
	TypeCheck([]*ct.CompilerError, *st.FuncEntry, *st.SymbolTables) []*ct.CompilerError
	GetType(*st.FuncEntry, *st.SymbolTables) types.Type
	ExprTranslateToLLVMStack(*st.FuncEntry, *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand)
}
