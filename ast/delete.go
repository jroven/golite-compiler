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

type Delete struct {
	*token.Token
	expr Expression
}

func NewDeleteStm(expr Expression, token *token.Token) *Delete {
	return &Delete{token, expr}
}

func (d *Delete) String() string {
	var out bytes.Buffer

	out.WriteString("delete ")       // DELETE
	out.WriteString(d.expr.String()) // expression
	out.WriteString(";")             // SEMICOLON

	return out.String()
}

func (d *Delete) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// The expression must be a pointer type
	if d.expr.GetType(function, tables) == types.NilTySig || d.expr.GetType(function, tables) == types.BoolTySig ||
		d.expr.GetType(function, tables) == types.IntTySig || d.expr.GetType(function, tables) == types.StringTySig {
		errors = append(errors, ct.NewCompilerError(d.Token,
			"delete statement requires expression to be a struct pointer but found \""+
				d.expr.GetType(function, tables).String()+"\" type", ct.SEMANTIC))
	}
	return errors
}

func (d *Delete) ReturnCheck() bool {
	return false
}

func (d *Delete) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	var instructions []cfg.Instruction
	new_instructions, bitcastOperand := d.expr.ExprTranslateToLLVMStack(currFunc, program)
	instructions = append(instructions, new_instructions...)
	bitcastName := program.RegisterGen()
	bitcastEntry := st.NewVarEntry(bitcastName, d.expr.GetType(currFunc, program.Tables), st.LOCAL, d.Token)
	currFunc.Variables.Insert(bitcastName, bitcastEntry)
	bitcastInstr := llvm.NewBitcast(llvm.NewLLVMRegister(bitcastEntry), d.expr.GetType(currFunc, program.Tables), bitcastOperand, types.NewPointerTy(types.Int8Sig))
	instructions = append(instructions, bitcastInstr)
	freeInstr := llvm.NewFree(llvm.NewLLVMRegister(bitcastEntry))
	instructions = append(instructions, freeInstr)
	block.AddInstructions(instructions)
	return block
}
