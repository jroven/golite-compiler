package cfg

import (
	"proj-optimization-overlords/codegen"
	st "proj-optimization-overlords/symboltable"
)

type Instruction interface {
	String() string
	TranslateToAssembly(armFunc *codegen.ARMFunction) []codegen.Instruction
	GetType() string
	Vars() []*st.VarEntry
}
