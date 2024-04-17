package ast

import (
	"bytes"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
	"strconv"
)

type Declaration struct {
	*token.Token
	ids []*Variable
	ty  *TypeNode
}

func NewDeclarationStm(ids []*Variable, ty *TypeNode, token *token.Token) *Declaration {
	return &Declaration{token, ids, ty}
}

func (d *Declaration) String() string {
	var out bytes.Buffer

	out.WriteString("var ") // VAR
	for i, id := range d.ids {
		out.WriteString(id.String()) // id
		if i < len(d.ids)-1 {
			out.WriteString(", ") // COMMA
		}
	}
	out.WriteString(" ")
	out.WriteString(d.ty.String()) // type
	out.WriteString(";")

	return out.String()
}

func (d *Declaration) BuildSymbolTable(errors []*ct.CompilerError, table *st.SymbolTable[*st.VarEntry]) []*ct.CompilerError {
	for _, id := range d.ids {
		// Check if variable has already been declared
		if entry := table.LocalContains(id.Identifier); entry != nil {
			errors = append(errors, ct.NewCompilerError(token.NewToken(d.Token.Line, d.Token.Column),
				"Redelaration of variable ("+id.Identifier+"). Other declaration at ("+
					strconv.Itoa(entry.Token.Line)+", "+strconv.Itoa(entry.Token.Column)+")", ct.SEMANTIC))
		}
		if table.Parent == nil {
			table.Insert(id.Identifier, st.NewVarEntry(id.Identifier, d.ty.Ty, st.GLOBAL, id.Token))
		} else {
			table.Insert(id.Identifier, st.NewVarEntry(id.Identifier, d.ty.Ty, st.LOCAL, id.Token))
		}
	}
	return errors
}

func (d *Declaration) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	if tables.Structs.Contains(d.ty.Ty.String()) == nil && d.ty.Ty != types.BoolTySig && d.ty.Ty != types.IntTySig {
		errors = append(errors, ct.NewCompilerError(d.Token, "Variable type in declaration must be a primitive type or a struct", ct.SEMANTIC))
	}
	return errors
}

func (d *Declaration) GlobalTranslateToLLVMStack(target string, tables *st.SymbolTables) []*llvm.LLVMGlobalDecl {
	var decls []*llvm.LLVMGlobalDecl
	var isStruct bool
	if tables.Structs.Contains(d.ty.Ty.String()) != nil {
		isStruct = true
	}
	for _, id := range d.ids {
		decls = append(decls, llvm.NewGlobalDecl(id.Identifier, d.ty.Ty, isStruct))
	}
	return decls
}

func (d *Declaration) LocalTranslateToLLVMStack(target string, tables *st.SymbolTables, llvmProg *llvm.LLVMProgram) []*llvm.Alloca {
	var decls []*llvm.Alloca
	for _, id := range d.ids {
		varEntry := st.NewVarEntry(id.Identifier, d.ty.Ty, st.LOCAL, id.Token)
		decls = append(decls, llvm.NewAlloca(d.ty.Ty, llvm.NewLLVMRegister(varEntry)))
	}
	return decls
}
