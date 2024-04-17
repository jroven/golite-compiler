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

type Invocation struct {
	*token.Token
	id   *Variable
	args []Expression
}

func NewInvocationStm(id *Variable, args []Expression, token *token.Token) *Invocation {
	return &Invocation{token, id, args}
}

func (inv *Invocation) String() string {
	var out bytes.Buffer

	out.WriteString(inv.id.String()) // id
	out.WriteString("(")             // LPAREN
	for i, expr := range inv.args {
		out.WriteString(expr.String()) // expression
		if i < len(inv.args)-1 {
			out.WriteString(", ") // COMMA
		}
	}
	out.WriteString(")") // RPAREN
	out.WriteString(";")

	return out.String()
}

func (inv *Invocation) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return tables.Funcs.Contains(inv.id.Identifier).RetTy
}

func (inv *Invocation) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	return errors
}

func (inv *Invocation) ReturnCheck() bool {
	return false
}

func (inv *Invocation) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	funcEntry := program.Tables.Funcs.Contains(inv.id.Identifier)
	var instructions []cfg.Instruction
	var paramTys []types.Type
	var params []llvm.LLVMOperand
	for _, arg := range inv.args {
		new_instructions, operand := arg.ExprTranslateToLLVMStack(currFunc, program)
		params = append(params, operand)
		paramTys = append(paramTys, arg.GetType(currFunc, program.Tables))
		instructions = append(instructions, new_instructions...)
	}
	instructions = append(instructions, llvm.NewCall(funcEntry.RetTy, inv.id.Identifier, paramTys, params))
	block.AddInstructions(instructions)
	return block
}

func (inv *Invocation) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	funcEntry := program.Tables.Funcs.Contains(inv.id.Identifier)
	var instructions []cfg.Instruction
	var paramTys []types.Type
	var params []llvm.LLVMOperand
	for _, arg := range inv.args {
		new_instructions, operand := arg.ExprTranslateToLLVMStack(currFunc, program)
		params = append(params, operand)
		paramTys = append(paramTys, arg.GetType(currFunc, program.Tables))
		instructions = append(instructions, new_instructions...)
	}
	newRegName := program.RegisterGen()
	regEntry := st.NewVarEntry(newRegName, inv.id.GetType(currFunc, program.Tables), st.LOCAL, inv.Token)
	currFunc.Variables.Insert(newRegName, regEntry)
	instructions = append(instructions, llvm.NewCallAssign(llvm.NewLLVMRegister(regEntry), funcEntry.RetTy, inv.id.Identifier, paramTys, params))
	return instructions, llvm.NewLLVMRegister(regEntry)
}
