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

type LValue struct {
	*token.Token
	id     *Variable
	fields []*Variable
}

func NewLvalueStm(id *Variable, fields []*Variable, token *token.Token) *LValue {
	return &LValue{token, id, fields}
}

func (lv *LValue) String() string {
	var out bytes.Buffer

	out.WriteString(lv.id.String()) // id
	if len(lv.fields) > 0 {
		for _, field := range lv.fields {
			out.WriteString(".")
			out.WriteString(field.String()) // field expression
		}
	}

	return out.String()
}

func (lv *LValue) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	new_errors := lv.TypeCheck(nil, function, tables)
	if len(new_errors) > 0 {
		return types.UnknownTySig
	}
	if len(lv.fields) > 0 {
		var field_entry *st.VarEntry
		var_type := lv.id.GetType(function, tables)
		struct_entry := tables.Structs.Contains(var_type.String())
		for _, field := range lv.fields {
			field_entry = struct_entry.Fields.Contains(field.Identifier)
			struct_entry = tables.Structs.Contains(field_entry.Ty.String())
		}
		return field_entry.Ty
	} else {
		return lv.id.GetType(function, tables)
	}
}

func (lv *LValue) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	if len(lv.fields) > 0 {
		// Check if the variable is a struct
		var_type := lv.id.GetType(function, tables)
		if tables.Structs.Contains(var_type.String()) == nil {
			errors = append(errors, ct.NewCompilerError(lv.Token, "undefined type \""+var_type.String()+"\".", ct.SEMANTIC))
			return errors
		}
		// Check if the fields are in the struct
		var field_entry *st.VarEntry
		struct_entry := tables.Structs.Contains(var_type.String())
		for _, field := range lv.fields {
			if struct_entry == nil {
				errors = append(errors, ct.NewCompilerError(lv.Token, "field \""+field_entry.Name+"\" type is not a defined struct type", ct.SEMANTIC))
				return errors
			}
			field_entry = struct_entry.Fields.Contains(field.Identifier)
			if field_entry == nil {
				errors = append(errors, ct.NewCompilerError(lv.Token, "field \""+field.Identifier+"\" not defined in \""+
					struct_entry.String()+"\" definition", ct.SEMANTIC))
				return errors
			}
			struct_entry = tables.Structs.Contains(field_entry.Ty.String())
		}
	} else {
		// Check if the variable is defined
		if function != nil && function.Variables.Contains(lv.id.Identifier) == nil ||
			function == nil && tables.Globals.Contains(lv.id.Identifier) == nil {
			errors = append(errors, ct.NewCompilerError(lv.Token, "undefined variable \""+lv.id.Identifier+"\".", ct.SEMANTIC))
		}
	}
	return errors
}

func (lv *LValue) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	varEntry := currFunc.Variables.Contains(lv.id.String())
	// Check is base is a parameter
	for _, param := range currFunc.Parameters {
		if param.Name == lv.id.String() {
			varEntry = currFunc.Variables.Contains("_P_" + lv.id.String())
		}
	}
	if len(lv.fields) > 0 {
		var new_instructions []cfg.Instruction
		elemReg := llvm.NewLLVMRegister(varEntry)
		fieldRegName := program.RegisterGen()
		fieldRegEntry := st.NewVarEntry(fieldRegName, varEntry.Ty, st.LOCAL, lv.Token)
		fieldReg := llvm.NewLLVMRegister(fieldRegEntry)
		currFunc.Variables.Insert(fieldRegName, fieldRegEntry)
		new_instructions = append(new_instructions, llvm.NewLoad(varEntry.Ty, fieldReg, elemReg))
		for i, id := range lv.fields {
			struct_entry := program.Tables.Structs.Contains(varEntry.Ty.String())
			field_entry := struct_entry.Fields.Contains(id.String())
			elemRegName := program.RegisterGen()
			elemVarEntry := st.NewVarEntry(elemRegName, field_entry.Ty, st.LOCAL, lv.Token)
			elemReg = llvm.NewLLVMRegister(elemVarEntry)
			currFunc.Variables.Insert(elemRegName, elemVarEntry)
			new_instructions = append(new_instructions, llvm.NewGetElementPtr(elemReg, fieldReg.GetType(), fieldReg, struct_entry.Offsets[id.String()]))
			fieldReg = elemReg
			//if field_entry.Ty.String() == varEntry.Ty.String() {
			if i < len(lv.fields)-1 {
				loadRegName := program.RegisterGen()
				loadVarEntry := st.NewVarEntry(loadRegName, field_entry.Ty, st.LOCAL, lv.Token)
				loadReg := llvm.NewLLVMRegister(loadVarEntry)
				currFunc.Variables.Insert(loadRegName, loadVarEntry)
				new_instructions = append(new_instructions, llvm.NewLoad(field_entry.Ty, loadReg, elemReg))
				fieldReg = loadReg
			}
			varEntry = field_entry
		}
		return new_instructions, elemReg
	} else {
		// return the register from varentry in the symbol table
		for _, param := range currFunc.Parameters {
			if param.Name == lv.id.Identifier {
				varEntry = currFunc.Variables.Contains("_P_" + lv.id.Identifier)
			}
		}
		return []cfg.Instruction{}, llvm.NewLLVMRegister(varEntry)
	}
}
