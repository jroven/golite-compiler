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

type TypeDeclaration struct {
	*token.Token
	id     *Variable
	fields []*Decl
}

func NewTypeDeclarationStm(id *Variable, fields []*Decl, token *token.Token) *TypeDeclaration {
	return &TypeDeclaration{token, id, fields}
}

func (td *TypeDeclaration) String() string {
	var out bytes.Buffer

	out.WriteString("type ")          // TYPE
	out.WriteString(td.id.String())   // id
	out.WriteString(" struct {\n")    // STRUCT LBRACE
	for _, field := range td.fields { // fields
		out.WriteString(field.String()) // field expression
		out.WriteString(";\n")
	}
	out.WriteString("};") // RBRACE SEMICOLON

	return out.String()
}

func (td *TypeDeclaration) BuildSymbolTable(errors []*ct.CompilerError, tables *st.SymbolTables) []*ct.CompilerError {
	// Make StructEntry in symbol table, check for duplicate struct names
	if entry := tables.Structs.Contains(td.id.String()); entry != nil {
		errors = append(errors, ct.NewCompilerError(td.Token, "Redeclaration of struct ("+td.id.String()+"). Other declaration at ("+strconv.Itoa(entry.Token.Line)+
			","+strconv.Itoa(entry.Token.Column)+")", ct.SEMANTIC))
	}
	entry := st.NewStructEntry(td.id.String(), td.Token)
	tables.Structs.Insert(td.id.String(), entry)
	for i, field := range td.fields {
		// Check if field name is already in struct
		if entry := entry.Fields.Contains(field.id.String()); entry != nil {
			errors = append(errors, ct.NewCompilerError(field.Token, "Redeclaration of variable ("+field.id.String()+"). Other declaration at ("+strconv.Itoa(entry.Token.Line)+
				","+strconv.Itoa(entry.Token.Column)+")", ct.SEMANTIC))
		}
		entry.Fields.Insert(field.id.String(), st.NewVarEntry(field.id.String(), field.ty.Ty, st.FIELD, field.Token))
		entry.Offsets[field.id.String()] = i
	}
	return errors
}

func (td *TypeDeclaration) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// struct type may only include fields of the primitive types and struct types defined in the file. You must also allow fields of its own type.
	var ty types.Type
	for _, field := range td.fields {
		ty = field.ty.Ty
		if ty != types.BoolTySig && ty != types.IntTySig && ty != types.StringTySig &&
			tables.Structs.Contains(ty.String()) == nil {
			if tables.Structs.Contains(ty.String()) == nil {
				errors = append(errors, ct.NewCompilerError(field.Token, "Field type must be a primitive type or a struct type defined in the file", ct.SEMANTIC))
			}
		}
	}
	return errors
}

func (td *TypeDeclaration) TranslateToLLVMStack(target string, tables *st.SymbolTables) *llvm.LLVMTypeDecl {
	// Create a new LLVMTypeDecl
	llvmTypeDecl := llvm.NewLLVMTypeDecl(td.id.String(), nil)
	// Add the fields to the LLVMTypeDecl
	for _, field := range td.fields {
		// If the field is a struct type, add the struct type to the LLVMTypeDecl
		if structEntry := tables.Structs.Contains(field.ty.Ty.String()); structEntry != nil {
			structType := types.NewStructTy(structEntry.Name)
			llvmTypeDecl.AddField(structType)
		} else {
			llvmTypeDecl.AddField(types.Int64Sig)
		}
	}
	return llvmTypeDecl
}
