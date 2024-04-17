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

type Read struct {
	*token.Token
	lVal *LValue
}

func NewReadStm(lVal *LValue, token *token.Token) *Read {
	return &Read{token, lVal}
}

func (r *Read) String() string {
	var out bytes.Buffer

	out.WriteString("scan ")         // SCAN
	out.WriteString(r.lVal.String()) // lvalue
	out.WriteString(";")             // SEMICOLON

	return out.String()
}

func (r *Read) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// Check if the lvalue is an int
	if r.lVal.GetType(function, tables) != types.IntTySig {
		errors = append(errors, ct.NewCompilerError(r.Token, "scan statement must be used with an int", ct.SEMANTIC))
	}
	return errors
}

func (r *Read) ReturnCheck() bool {
	return false
}

func (r *Read) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	id := r.lVal.id.Identifier
	for _, param := range currFunc.Parameters {
		if param.Name == id {
			id = "_P_" + id
			break
		}
	}
	lValVarEntry := currFunc.Variables.Contains(id)
	scanfInstr := llvm.NewScanf(lValVarEntry)
	block.AddInstr(scanfInstr)
	return block
}
