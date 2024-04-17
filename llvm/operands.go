package llvm

import (
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/types"
	"strconv"
)

type LLVMRegister struct {
	Entry *st.VarEntry
	IsPtr bool
}

func NewLLVMRegister(entry *st.VarEntry) *LLVMRegister {
	return &LLVMRegister{entry, false}
}

func (reg *LLVMRegister) GetType() types.Type {
	return reg.Entry.Ty
}

func (reg *LLVMRegister) String() string {
	if reg.Entry.Scope == st.GLOBAL {
		return "@" + reg.Entry.Name
	}
	return "%" + reg.Entry.Name
}

func (reg *LLVMRegister) GetRegister() *LLVMRegister {
	return reg
}

func (reg *LLVMRegister) GetImmediate() *LLVMImmediate {
	return nil
}

type LLVMImmediate struct {
	value int
	ty    types.Type
}

func NewLLVMImmediate(value int, ty types.Type) *LLVMImmediate {
	return &LLVMImmediate{value, ty}
}

func (im *LLVMImmediate) GetType() types.Type {
	return im.ty
}

func (im *LLVMImmediate) String() string {
	if im.ty == types.NilTySig {
		return "null"
	}
	return strconv.Itoa(im.value)
}

func (im *LLVMImmediate) GetRegister() *LLVMRegister {
	return nil
}

func (im *LLVMImmediate) GetImmediate() *LLVMImmediate {
	return im
}
