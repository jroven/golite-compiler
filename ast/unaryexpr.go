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

type UnaryExpr struct {
	*token.Token
	op   Operator
	expr Expression
}

func NewUnaryExprStm(op Operator, expr Expression, token *token.Token) *UnaryExpr {
	return &UnaryExpr{token, op, expr}
}

func (ue *UnaryExpr) String() string {
	var out bytes.Buffer

	out.WriteString(" " + opString(ue.op)) // operator
	out.WriteString(ue.expr.String())      // expression

	return out.String()
}

func (ue *UnaryExpr) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	return ue.expr.GetType(function, tables)
}

func (ue *UnaryExpr) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	return errors
}

func (ue *UnaryExpr) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	var instrs []cfg.Instruction
	var negReg *llvm.LLVMRegister
	if ue.op == MINUS {
		posInstrs, posOp := ue.expr.ExprTranslateToLLVMStack(currFunc, program)
		instrs = append(instrs, posInstrs...)
		negRegName := program.RegisterGen()
		negEntry := st.NewVarEntry(negRegName, types.Int64Sig, st.LOCAL, ue.Token)
		currFunc.Variables.Insert(negRegName, negEntry)
		negReg = llvm.NewLLVMRegister(negEntry)
		negateInstr := llvm.NewBinOp(negReg, llvm.MUL, types.Int64Sig, llvm.NewLLVMImmediate(-1, types.Int64Sig), posOp)
		instrs = append(instrs, negateInstr)
	} else if ue.op == NOT {
		posInstrs, posOp := ue.expr.ExprTranslateToLLVMStack(currFunc, program)
		instrs = append(instrs, posInstrs...)
		negEntry := st.NewVarEntry(program.RegisterGen(), types.Int1Sig, st.LOCAL, ue.Token)
		currFunc.Variables.Insert(negEntry.Name, negEntry)
		negReg = llvm.NewLLVMRegister(negEntry)
		var negType types.Type
		if posReg := posOp.GetRegister(); posReg != nil {
			negType = posReg.Entry.Ty
		}
		negateInstr := llvm.NewICMP(negReg, llvm.EQ, negType, posOp, llvm.NewLLVMImmediate(0, negType))
		instrs = append(instrs, negateInstr)
	}
	return instrs, negReg
}
