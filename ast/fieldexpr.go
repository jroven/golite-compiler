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

// expr
// id list of variables
type FieldExpr struct {
	*token.Token
	base Expression
	ids  []*Variable
}

func NewFieldExprStm(base Expression, ids []*Variable, token *token.Token) *FieldExpr {
	return &FieldExpr{token, base, ids}
}

func (fe *FieldExpr) String() string {
	var out bytes.Buffer

	out.WriteString(fe.base.String()) // base expression
	for _, id := range fe.ids {
		out.WriteString(".")
		out.WriteString(id.String()) // field expression
	}
	return out.String()
}

func (fe *FieldExpr) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	new_errors := fe.TypeCheck(nil, function, tables)
	if len(new_errors) > 0 {
		return types.UnknownTySig
	}
	if len(fe.ids) > 0 {
		var_type := fe.base.GetType(function, tables)
		struct_entry := tables.Structs.Contains(var_type.String())
		var field_entry *st.VarEntry
		for _, id := range fe.ids {
			field_entry = struct_entry.Fields.Contains(id.Identifier)
			struct_entry = tables.Structs.Contains(field_entry.Ty.String())
		}
		return field_entry.Ty
	} else {
		return fe.base.GetType(function, tables)
	}

}

func (fe *FieldExpr) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// Check if id is struct and that fields are valid
	var field_entry *st.VarEntry
	if len(fe.ids) > 0 {
		num_errors := len(errors)
		errors = fe.base.TypeCheck(errors, function, tables)
		if len(errors) > num_errors {
			return errors
		}
		base_type := fe.base.GetType(function, tables)
		struct_entry := tables.Structs.Contains(base_type.String())
		for _, id := range fe.ids {
			if struct_entry == nil {
				errors = append(errors, ct.NewCompilerError(token.NewToken(fe.Token.Line, fe.Token.Column),
					field_entry.Ty.String()+" is not a struct: Can't call fields", ct.SEMANTIC))
				return errors
			} else if struct_entry.Fields.Contains(id.Identifier) == nil {
				errors = append(errors, ct.NewCompilerError(token.NewToken(fe.Token.Line, fe.Token.Column),
					"Did not find field: "+id.Identifier+" inside "+struct_entry.Name+" struct", ct.SEMANTIC))
				return errors
			}
			field_entry = struct_entry.Fields.Contains(id.Identifier)
			struct_entry = tables.Structs.Contains(field_entry.Ty.String())
		}
	}
	errors = fe.base.TypeCheck(errors, function, tables)
	return errors
}

func (fe *FieldExpr) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	if len(fe.ids) > 0 {
		var new_instructions []cfg.Instruction
		varEntry := currFunc.Variables.Contains(fe.base.String())
		// Check is base is a parameter
		for _, param := range currFunc.Parameters {
			if param.Name == fe.base.String() {
				varEntry = currFunc.Variables.Contains("_P_" + fe.base.String())
			}
		}
		elemReg := llvm.NewLLVMRegister(varEntry)
		fieldRegName := program.RegisterGen()
		fieldRegEntry := st.NewVarEntry(fieldRegName, varEntry.Ty, st.LOCAL, fe.Token)
		currFunc.Variables.Insert(fieldRegName, fieldRegEntry)
		fieldReg := llvm.NewLLVMRegister(fieldRegEntry)
		new_instructions = append(new_instructions, llvm.NewLoad(varEntry.Ty, fieldReg, elemReg))
		for i, id := range fe.ids {
			struct_entry := program.Tables.Structs.Contains(varEntry.Ty.String())
			field_entry := struct_entry.Fields.Contains(id.String())
			elemRegName := program.RegisterGen()
			elemVarEntry := st.NewVarEntry(elemRegName, field_entry.Ty, st.LOCAL, fe.Token)
			currFunc.Variables.Insert(elemRegName, elemVarEntry)
			elemReg = llvm.NewLLVMRegister(elemVarEntry)
			new_instructions = append(new_instructions, llvm.NewGetElementPtr(elemReg, fieldReg.GetType(), fieldReg, struct_entry.Offsets[id.String()]))
			fieldReg = elemReg
			if i < len(fe.ids)-1 {
				loadRegName := program.RegisterGen()
				loadVarEntry := st.NewVarEntry(loadRegName, field_entry.Ty, st.LOCAL, fe.Token)
				currFunc.Variables.Insert(loadRegName, loadVarEntry)
				loadReg := llvm.NewLLVMRegister(loadVarEntry)
				new_instructions = append(new_instructions, llvm.NewLoad(field_entry.Ty, loadReg, elemReg))
				fieldReg = loadReg
			}
			varEntry = field_entry
		}
		loadRegName := program.RegisterGen()
		loadVarEntry := st.NewVarEntry(loadRegName, varEntry.Ty, st.LOCAL, fe.Token)
		currFunc.Variables.Insert(loadRegName, loadVarEntry)
		loadReg := llvm.NewLLVMRegister(loadVarEntry)
		new_instructions = append(new_instructions, llvm.NewLoad(varEntry.Ty, loadReg, elemReg))
		fieldReg = loadReg
		return new_instructions, fieldReg
	} else {
		return fe.base.ExprTranslateToLLVMStack(currFunc, program)
	}
}
