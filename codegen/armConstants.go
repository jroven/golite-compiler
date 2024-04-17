package codegen

type ARMBinOpTy int

const (
	ADD ARMBinOpTy = iota
	SUB
	MUL
	SDIV
	AND
	OR
)

func (binTy ARMBinOpTy) String() string {
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
		return "orr"
	}
	panic("Error: Invalid operator")
}

type ConditionCode int

const (
	EQ ConditionCode = iota
	NE
	GT
	GE
	LT
	LE
)

func (cc ConditionCode) String() string {
	switch cc {
	case EQ:
		return "eq"
	case NE:
		return "ne"
	case GT:
		return "gt"
	case GE:
		return "ge"
	case LT:
		return "lt"
	case LE:
		return "le"
	}
	panic("Error: Invalid condition code")
}
