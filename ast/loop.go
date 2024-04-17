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

type Loop struct {
	*token.Token
	expr  Expression
	block *Block
}

func NewLoopStm(expr Expression, block *Block, token *token.Token) *Loop {
	return &Loop{token, expr, block}
}

func (l *Loop) String() string {
	var out bytes.Buffer

	out.WriteString("for (")          // DELETE LPAREN
	out.WriteString(l.expr.String())  // expression
	out.WriteString(") ")             // RPAREN LBRACE
	out.WriteString(l.block.String()) // Block

	return out.String()
}

func (l *Loop) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// The conditional expression for the loop statements must be a boolean expression.
	errors = l.expr.TypeCheck(errors, function, tables)
	if l.expr.GetType(function, tables) != types.BoolTySig {
		errors = append(errors, ct.NewCompilerError(l.Token, "condition expression must be a boolean. Found "+
			l.expr.GetType(function, tables).String()+" type", ct.SEMANTIC))
	}
	errors = l.block.TypeCheck(errors, function, tables)
	return errors
}

func (l *Loop) ReturnCheck() bool {
	return l.block.ReturnCheck()
}

func (l *Loop) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, llvmProg *llvm.LLVMProgram) *cfg.Block {
	forEntry, forBody, forExit := cfg.NewForBlock(block, llvmProg.LabelGen)
	block.AddInstr(llvm.NewBr(forEntry.Label))
	llvmFunc := llvmProg.FuncDefs[currFunc.Name]
	llvmFunc.AddBlock(forEntry.Label, forEntry)
	llvmFunc.AddBlock(forBody.Label, forBody)
	llvmFunc.AddBlock(forExit.Label, forExit)
	cInstrs, cOperand := l.expr.ExprTranslateToLLVMStack(currFunc, llvmProg)
	forEntry.AddInstructions(cInstrs)
	if cOperand.GetRegister() != nil && cOperand.GetRegister().Entry.Ty.String() == "i64" {
		truncRegName := llvmProg.RegisterGen()
		truncRegEntry := st.NewVarEntry(truncRegName, types.Int1Sig, st.LOCAL, l.Token)
		currFunc.Variables.Insert(truncRegName, truncRegEntry)
		truncReg := llvm.NewLLVMRegister(truncRegEntry)
		truncInstr := llvm.NewTrunc(truncReg, types.Int64Sig, cOperand, types.Int1Sig)
		cOperand = truncReg
		forEntry.AddInstr(truncInstr)
	}
	selRegName := llvmProg.RegisterGen()
	SelRegEntry := st.NewVarEntry(selRegName, types.Int1Sig, st.LOCAL, l.Token)
	currFunc.Variables.Insert(selRegName, SelRegEntry)
	selReg := llvm.NewLLVMRegister(SelRegEntry)
	selInstr := llvm.NewSelect(selReg, types.Int1Sig, cOperand, types.Int1Sig, llvm.NewLLVMImmediate(1, types.Int1Sig), llvm.NewLLVMImmediate(0, types.Int1Sig))
	forEntry.AddInstr(selInstr)
	brCondInstr := llvm.NewBrCond(cOperand, forBody.Label, forExit.Label, llvm.EQ)
	forEntry.AddInstr(brCondInstr)
	for _, stm := range l.block.statements {
		forBody = stm.TranslateToLLVMStack(forBody, currFunc, llvmProg)
	}
	brInstr := llvm.NewBr(forEntry.Label)
	forBody.AddInstr(brInstr)
	return forExit
}
