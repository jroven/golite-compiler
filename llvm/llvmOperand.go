package llvm

import (
	"proj-optimization-overlords/cfg"
	"proj-optimization-overlords/types"
)

type LLVMOperand interface {
	cfg.Operand
	GetType() types.Type
	GetRegister() *LLVMRegister
	GetImmediate() *LLVMImmediate
}
