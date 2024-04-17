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

type Assignment struct {
	*token.Token
	lVal  *LValue
	right Expression
}

func NewAssignmentStm(lVal *LValue, right Expression,
	token *token.Token) *Assignment {
	return &Assignment{token, lVal, right}
}

func (a *Assignment) String() string {
	var out bytes.Buffer

	out.WriteString(a.lVal.String())  // lvalue
	out.WriteString(" = ")            // EQUALS
	out.WriteString(a.right.String()) // expression
	out.WriteString(";")              // SEMICOLON

	return out.String()
}

func (a *Assignment) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// Assignment statements require the left-hand side and right-hand side to have same type. However, nil can be defined to any struct type.
	num_errors := len(errors)
	errors = a.lVal.TypeCheck(errors, function, tables)
	errors = a.right.TypeCheck(errors, function, tables)
	if num_errors == len(errors) {
		if a.lVal.GetType(function, tables).String() != a.right.GetType(function, tables).String() &&
			!(a.right.GetType(function, tables) == types.NilTySig &&
				tables.Structs.Contains(a.lVal.GetType(function, tables).String()) != nil) {
			errors = append(errors, ct.NewCompilerError(a.Token, "left-hand side value of type \""+
				a.lVal.GetType(function, tables).String()+"\" does not match its expression of type \""+
				a.right.GetType(function, tables).String()+"\"", ct.SEMANTIC))
		}
	}
	return errors
}

func (a *Assignment) ReturnCheck() bool {
	return false
}

func (a *Assignment) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	var instructions []cfg.Instruction
	r_instructions, RightOperand := a.right.ExprTranslateToLLVMStack(currFunc, program)
	instructions = append(instructions, r_instructions...)
	l_instructions, LOperand := a.lVal.ExprTranslateToLLVMStack(currFunc, program)
	instructions = append(instructions, l_instructions...)
	lType := a.lVal.GetType(currFunc, program.Tables)
	var lReg *llvm.LLVMRegister
	if reg := LOperand.GetRegister(); reg != nil {
		lReg = reg
	} else {
		lReg = llvm.NewLLVMRegister(st.NewVarEntry(program.RegisterGen(), lType, st.LOCAL, a.Token))
	}
	instructions = append(instructions, llvm.NewStore(lType, RightOperand, lReg))
	for _, instruction := range instructions {
		block.AddInstr(instruction)
	}
	return block
}
