package ast

import (
	"bytes"
	ct "proj-optimization-overlords/context"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
)

type Block struct {
	*token.Token
	statements []Statement
}

func NewBlockStm(statements []Statement, token *token.Token) *Block {
	return &Block{token, statements}
}

func (b *Block) String() string {
	var out bytes.Buffer

	out.WriteString("{\n") // LBRACE
	for _, stm := range b.statements {
		out.WriteString(stm.String()) // statements
		out.WriteString("\n")
	}
	out.WriteString("}") // RBRACE

	return out.String()
}

func (b *Block) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	for _, stm := range b.statements {
		errors = stm.TypeCheck(errors, function, tables)
	}
	return errors
}

func (b *Block) ReturnCheck() bool {
	for _, stm := range b.statements {
		if stm.ReturnCheck() {
			return true
		}
	}
	return false
}
