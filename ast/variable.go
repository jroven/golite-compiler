package ast

import (
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
)

type Variable struct {
	*token.Token
	Identifier string
}

func NewVariableStm(identifier string, token *token.Token) *Variable {
	return &Variable{token, identifier}
}

func (v *Variable) String() string {
	return v.Identifier
}

func (v *Variable) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	if function.Variables.Contains(v.Identifier) != nil {
		return function.Variables.Contains(v.Identifier).Ty
	}
	return types.UnknownTySig
}

func (v *Variable) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	var entry *st.VarEntry
	if entry = function.Variables.Contains(v.Identifier); entry == nil {
		errors = append(errors, ct.NewCompilerError(v.Token, "Variable \""+v.Identifier+"\" not defined", ct.SEMANTIC))
	}
	return errors
}

func (v *Variable) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	varEntry := currFunc.Variables.Contains(v.Identifier)
	for _, param := range currFunc.Parameters {
		if param.Name == v.Identifier {
			varEntry = currFunc.Variables.Contains("_P_" + v.Identifier)
		}
	}
	newRegName := program.RegisterGen()
	destEntry := st.NewVarEntry(newRegName, varEntry.Ty, st.LOCAL, v.Token)
	currFunc.Variables.Insert(newRegName, destEntry)
	loadInstr := llvm.NewLoad(v.GetType(currFunc, nil), llvm.NewLLVMRegister(destEntry), llvm.NewLLVMRegister(varEntry))
	return []cfg.Instruction{loadInstr}, llvm.NewLLVMRegister(destEntry)
}
