package ast

import (
	"bytes"
	"proj-optimization-overlords/token"
)

type ReturnType struct {
	*token.Token
	ty *TypeNode
}

func NewReturnTypeStm(ty *TypeNode, token *token.Token) *ReturnType {
	return &ReturnType{token, ty}
}

func (r *ReturnType) String() string {
	var out bytes.Buffer

	out.WriteString(r.ty.String()) // type

	return out.String()
}
