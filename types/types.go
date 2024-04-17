package types

// Type includes information about working on Types
type Type interface {
	String() string
}

type IntTy struct{}

func (intTy *IntTy) String() string {
	return "int"
}

type BoolTy struct{}

func (boolTy *BoolTy) String() string {
	return "bool"
}

type StringTy struct{}

func (stringTy *StringTy) String() string {
	return "string"
}

type NilTy struct{}

func (nilTy *NilTy) String() string {
	return "nil"
}

type UnknownTy struct{}

func (unknownTy *UnknownTy) String() string {
	return "unknown"
}

type StructTy struct {
	id string
}

func NewStructTy(id string) *StructTy {
	return &StructTy{id}
}

func (structTy *StructTy) String() string {
	return structTy.id
}

type PointerTy struct {
	ty Type
}

func NewPointerTy(ty Type) *PointerTy {
	return &PointerTy{ty}
}

func (pointerTy *PointerTy) String() string {
	return "%" + "struct." + pointerTy.ty.String() + "*"
}

type Int1 struct{}

func (int1 *Int1) String() string {
	return "i1"
}

type Int8 struct{}

func (int8 *Int8) String() string {
	return "i8"
}

type Int64 struct{}

func (int64 *Int64) String() string {
	return "i64"
}

func (int64 *Int64) LLVMString() string {
	return "i64"
}

func StringToType(ty string) Type {
	if ty == "int" {
		return IntTySig
	} else if ty == "bool" {
		return BoolTySig
	} else if ty == "string" {
		return StringTySig
	} else {
		return NewStructTy(ty)
	}
}

func TypeToLLVMString(ty Type) string {
	if ty == Int1Sig {
		return "i1"
	} else if ty == Int8Sig {
		return "i8"
	} else if ty == Int64Sig {
		return "i64"
	} else if pointerTy, ok := ty.(*PointerTy); ok {
		return TypeToLLVMString(pointerTy.ty) + "*"
	} else if structTy, ok := ty.(*StructTy); ok {
		return "%" + "struct." + structTy.id + "*"
	}
	return "i64"
}

func TypeToFieldString(ty Type) string {
	if ty == Int1Sig {
		return "i1"
	} else if ty == Int8Sig {
		return "i8"
	} else if ty == Int64Sig {
		return "i64"
	} else if pointerTy, ok := ty.(*PointerTy); ok {
		return TypeToFieldString(pointerTy.ty) + "*"
	} else if structTy, ok := ty.(*StructTy); ok {
		return "%" + "struct." + structTy.id
	}
	return "i64"
}

var IntTySig *IntTy
var BoolTySig *BoolTy
var StringTySig *StringTy
var NilTySig *NilTy
var UnknownTySig *UnknownTy
var Int1Sig *Int1
var Int8Sig *Int8
var Int64Sig *Int64

// The init() function will only be called once per package. This is where you can setup singletons for types
func init() {
	IntTySig = &IntTy{}
	BoolTySig = &BoolTy{}
	StringTySig = &StringTy{}
	NilTySig = &NilTy{}
	UnknownTySig = &UnknownTy{}
	Int1Sig = &Int1{}
	Int8Sig = &Int8{}
	Int64Sig = &Int64{}
}
