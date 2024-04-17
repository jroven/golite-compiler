package codegen

import (
	"bytes"
	"fmt"
	"strconv"
)

type ARMOperand interface {
	String() string
	GetRegister() *ARMRegister
	GetAddress() *ARMAddress
	GetImmediate() *ARMImmediate
}

type ARMRegister struct {
	Val string
}

func NewARMRegister(val string) *ARMRegister {
	return &ARMRegister{val}
}

func (reg *ARMRegister) String() string {
	return reg.Val
}

func (reg *ARMRegister) GetRegister() *ARMRegister {
	return reg
}

func NewARMRegFromInt(i int) *ARMRegister {
	return NewARMRegister("x" + strconv.Itoa(i))
}

func (reg *ARMRegister) GetAddress() *ARMAddress {
	return nil
}

func (reg *ARMRegister) GetImmediate() *ARMImmediate {
	return nil
}

type ARMImmediate struct {
	Val int
}

func NewARMImmediate(val int) *ARMImmediate {
	return &ARMImmediate{val}
}

func (imm *ARMImmediate) String() string {
	return "#" + fmt.Sprint(imm.Val)
}

func (imm *ARMImmediate) GetRegister() *ARMRegister {
	return nil
}

func (imm *ARMImmediate) GetAddress() *ARMAddress {
	return nil
}

func (imm *ARMImmediate) GetImmediate() *ARMImmediate {
	return imm
}

type ARMAddress struct {
	Base   *ARMRegister
	Offset []*ARMImmediate
}

func NewARMAddress(base *ARMRegister, offset []*ARMImmediate) *ARMAddress {
	return &ARMAddress{base, offset}
}

func (addr *ARMAddress) String() string {
	var out bytes.Buffer
	out.WriteString(addr.Base.String())
	if len(addr.Offset) > 0 {
		out.WriteString(", ")
		out.WriteString(addr.Offset[0].String())
	}
	return out.String()
}

func (addr *ARMAddress) GetRegister() *ARMRegister {
	return nil
}

func (addr *ARMAddress) GetAddress() *ARMAddress {
	return addr
}

func (addr *ARMAddress) GetImmediate() *ARMImmediate {
	return nil
}
