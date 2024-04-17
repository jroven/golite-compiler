package llvm

import "proj-optimization-overlords/codegen"

type BinOpTy int

const (
	ADD BinOpTy = iota
	SUB
	MUL
	SDIV
	AND
	OR
)

func (binTy BinOpTy) String() string {
	switch binTy {
	case ADD:
		return "add"
	case SUB:
		return "sub"
	case MUL:
		return "mul"
	case SDIV:
		return "sdiv"
	case AND:
		return "and"
	case OR:
		return "or"
	}
	panic("Error: Invalid operator")
}

func (binTy BinOpTy) ToARM() codegen.ARMBinOpTy {
	switch binTy {
	case ADD:
		return codegen.ADD
	case SUB:
		return codegen.SUB
	case MUL:
		return codegen.MUL
	case SDIV:
		return codegen.SDIV
	case AND:
		return codegen.AND
	case OR:
		return codegen.OR
	}
	panic("Error: Invalid operator")
}

type ConditionCode int

const (
	EQ ConditionCode = iota
	NE
	SGT
	SGE
	SLT
	SLE
)

func (cc ConditionCode) String() string {
	switch cc {
	case EQ:
		return "eq"
	case NE:
		return "ne"
	case SGT:
		return "sgt"
	case SGE:
		return "sge"
	case SLT:
		return "slt"
	case SLE:
		return "sle"
	}
	panic("Error: Invalid condition code")
}

func (cc ConditionCode) Negate() ConditionCode {
	switch cc {
	case EQ:
		return NE
	case NE:
		return EQ
	case SGT:
		return SLE
	case SGE:
		return SLT
	case SLT:
		return SGE
	case SLE:
		return SGT
	}
	panic("Error: Invalid condition code")
}

func (cc ConditionCode) ARMString() string {
	switch cc {
	case EQ:
		return "eq"
	case NE:
		return "ne"
	case SGT:
		return "gt"
	case SGE:
		return "ge"
	case SLT:
		return "lt"
	case SLE:
		return "le"
	}
	panic("Error: Invalid condition code")
}

func (cc ConditionCode) ToARM() codegen.ConditionCode {
	switch cc {
	case EQ:
		return codegen.EQ
	case NE:
		return codegen.NE
	case SGT:
		return codegen.GT
	case SGE:
		return codegen.GE
	case SLT:
		return codegen.LT
	case SLE:
		return codegen.LE
	}
	panic("Error: Invalid condition code")
}
