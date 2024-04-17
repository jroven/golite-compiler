package ast

import (
	"bytes"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type TypeNode struct {
	*token.Token
	Ty types.Type
}

func NewTypeNodeStm(ty types.Type, token *token.Token) *TypeNode {
	return &TypeNode{token, ty}
}

func (tn *TypeNode) String() string {
	var out bytes.Buffer

	if intType := tn.Ty.String(); intType == "int" {
		out.WriteString(intType) // INT
	} else if boolType := tn.Ty.String(); boolType == "bool" {
		out.WriteString(boolType) // BOOL
	} else {
		out.WriteString("*")            // ASTERISK
		out.WriteString(tn.Ty.String()) // id
	}

	return out.String()
}
