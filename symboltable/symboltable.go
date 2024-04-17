package symboltable

import (
	"fmt"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type VarScope int

const (
	GLOBAL VarScope = iota
	LOCAL
	FIELD
	PARAM
)

type VarEntry struct {
	*token.Token
	Name  string
	Ty    types.Type
	Scope VarScope
}

func NewVarEntry(name string, ty types.Type, scope VarScope, token *token.Token) *VarEntry {
	return &VarEntry{token, name, ty, scope}
}

func (entry *VarEntry) String() string { return entry.Name }

type StructEntry struct {
	*token.Token
	Name    string
	Fields  *SymbolTable[*VarEntry]
	Offsets map[string]int
}

func NewStructEntry(name string, token *token.Token) *StructEntry {
	return &StructEntry{token, name, NewSymbolTable[*VarEntry](nil), make(map[string]int)}
}

func (entry *StructEntry) String() string { return entry.Name }

type FuncEntry struct {
	*token.Token
	Name       string
	RetTy      types.Type
	Parameters []*VarEntry
	Variables  *SymbolTable[*VarEntry]
}

func NewFuncEntry(name string, retTy types.Type, token *token.Token) *FuncEntry {
	return &FuncEntry{token, name, retTy, nil, NewSymbolTable[*VarEntry](nil)}
}

func (entry *FuncEntry) String() string { return entry.Name }

type SymbolTables struct {
	Globals *SymbolTable[*VarEntry]
	Structs *SymbolTable[*StructEntry]
	Funcs   *SymbolTable[*FuncEntry]
}

func NewSymbolTables() *SymbolTables {
	return &SymbolTables{NewSymbolTable[*VarEntry](nil), NewSymbolTable[*StructEntry](nil), NewSymbolTable[*FuncEntry](nil)}
}

type SymbolTable[T fmt.Stringer] struct {
	Parent   *SymbolTable[T]
	Table    map[string]T
	Iterable []T
}

func NewSymbolTable[T fmt.Stringer](parent *SymbolTable[T]) *SymbolTable[T] {
	return &SymbolTable[T]{parent, make(map[string]T), []T{}}
}

func (st *SymbolTable[T]) Insert(id string, entry T) {
	st.Table[id] = entry
	st.Iterable = append(st.Iterable, entry)
}

func (st *SymbolTable[T]) Contains(id string) T {
	if entry, ok := st.Table[id]; ok {
		return entry
	}
	if st.Parent != nil {
		return st.Parent.Contains(id)
	}
	var empty T
	return empty
}

func (st *SymbolTable[T]) LocalContains(id string) T {
	if entry, ok := st.Table[id]; ok {
		return entry
	}
	var empty T
	return empty
}
