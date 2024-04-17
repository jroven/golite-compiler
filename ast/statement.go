package ast

import (
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
)

type Statement interface {
	String() string
	TypeCheck([]*ct.CompilerError, *st.FuncEntry, *st.SymbolTables) []*ct.CompilerError
	ReturnCheck() bool
	TranslateToLLVMStack(*cfg.Block, *st.FuncEntry, *llvm.LLVMProgram) *cfg.Block
}
