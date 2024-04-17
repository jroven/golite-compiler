package ast

import (
	"bytes"
	ct "proj-optimization-overlords/context"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
)

type Decl struct {
	*token.Token
	id *Variable
	ty *TypeNode
}

func NewDeclStm(id *Variable, ty *TypeNode, token *token.Token) *Decl {
	return &Decl{token, id, ty}
}

func (d *Decl) String() string {
	var out bytes.Buffer

	out.WriteString(d.id.String()) // id
	out.WriteString(" ")
	out.WriteString(d.ty.String()) // type

	return out.String()
}

func (d *Decl) BuildSymbolTable(errors []*ct.CompilerError, tables *st.SymbolTables) []*ct.CompilerError {
	entry := st.NewVarEntry(d.id.String(), d.ty.Ty, st.GLOBAL, d.Token)
	tables.Globals.Insert(d.id.String(), entry)
	return errors
}
