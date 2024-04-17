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

type Return struct {
	*token.Token
	expr Expression
}

func NewReturnStm(expr Expression, token *token.Token) *Return {
	return &Return{token, expr}
}

func (r *Return) String() string {
	var out bytes.Buffer

	out.WriteString("return") // RETURN
	if r.expr != nil {
		out.WriteString(" ")
		out.WriteString(r.expr.String()) // expression
	}
	out.WriteString(";") // SEMICOLON

	return out.String()
}

func (r *Return) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	if r.expr == nil {
		if function.RetTy != nil {
			errors = append(errors, ct.NewCompilerError(r.Token, "return statement requires a return value of type \""+
				function.RetTy.String()+"\"", ct.SEMANTIC))
			return errors
		}
	} else if r.expr.GetType(function, tables).String() != function.RetTy.String() {
		if function.RetTy == nil {
			errors = append(errors, ct.NewCompilerError(r.Token, "return statement returns a value of type \""+
				r.expr.GetType(function, tables).String()+"\" but the function does not return a type", ct.SEMANTIC))
		} else {
			errors = append(errors, ct.NewCompilerError(r.Token, "return statement returns a value of type \""+
				r.expr.GetType(function, tables).String()+"\" but the function returns a type \""+
				function.RetTy.String()+"\"", ct.SEMANTIC))
		}
	}
	return errors
}

func (r *Return) ReturnCheck() bool {
	return true
}

func (r *Return) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	var new_instructions []cfg.Instruction
	var instructions []cfg.Instruction
	var operand llvm.LLVMOperand
	retReg := llvm.NewLLVMRegister(currFunc.Variables.Contains("_ret_val"))

	if r.expr != nil {
		new_instructions, operand = r.expr.ExprTranslateToLLVMStack(currFunc, program)
		instructions = append(instructions, new_instructions...)
		instructions = append(instructions, llvm.NewStore(r.expr.GetType(currFunc, program.Tables), operand, retReg))
		exprType := r.expr.GetType(currFunc, program.Tables)
		retRegName := program.RegisterGen()
		retRegVar := st.NewVarEntry(retRegName, types.Int64Sig, st.LOCAL, r.Token)
		reg := llvm.NewLLVMRegister(retRegVar)
		currFunc.Variables.Insert(retRegName, retRegVar)
		instructions = append(instructions, llvm.NewLoad(exprType, reg, retReg))
		instructions = append(instructions, llvm.NewRet(exprType, reg))
		block.AddInstructions(instructions)
	} else {
		endRetInstr := llvm.NewStore(types.Int64Sig, llvm.NewLLVMImmediate(0, types.Int64Sig), retReg)
		block.AddInstr(endRetInstr)
		retRegName := program.RegisterGen()
		retRegVar := st.NewVarEntry(retRegName, types.Int64Sig, st.LOCAL, r.Token)
		reg := llvm.NewLLVMRegister(retRegVar)
		currFunc.Variables.Insert(retRegName, retRegVar)
		load := llvm.NewLoad(types.Int64Sig, reg, retReg)
		block.AddInstr(load)
		retInstr := llvm.NewRet(types.Int64Sig, reg)
		block.AddInstr(retInstr)
	}
	return block
}
