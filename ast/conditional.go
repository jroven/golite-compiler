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

type Conditional struct {
	*token.Token
	expr      Expression
	ifblock   *Block
	elseblock *Block
}

func NewConditionalStm(expr Expression, ifblock *Block, elseblock *Block, token *token.Token) *Conditional {
	return &Conditional{token, expr, ifblock, elseblock}
}

func (c *Conditional) String() string {
	var out bytes.Buffer

	out.WriteString("if (")             // IF LPAREN
	out.WriteString(c.expr.String())    // expression
	out.WriteString(") ")               // RPAREN
	out.WriteString(c.ifblock.String()) // Block
	if c.elseblock != nil {
		out.WriteString(" else ")             // ELSE
		out.WriteString(c.elseblock.String()) // Block
	}

	return out.String()
}

func (c *Conditional) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	// The conditional expression for the if statements must be a boolean expression.
	errors = c.expr.TypeCheck(errors, function, tables)
	if c.expr.GetType(function, tables) != types.BoolTySig {
		errors = append(errors, ct.NewCompilerError(c.Token, "if conditional expression expects bool type but found "+
			c.expr.GetType(function, tables).String()+" type", ct.SEMANTIC))
	}
	errors = c.ifblock.TypeCheck(errors, function, tables)
	if c.elseblock != nil {
		errors = c.elseblock.TypeCheck(errors, function, tables)
	}
	return errors
}

func (c *Conditional) ReturnCheck() bool {
	return c.ifblock.ReturnCheck() && (c.elseblock != nil && c.elseblock.ReturnCheck())
}

func (c *Conditional) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, llvmProg *llvm.LLVMProgram) *cfg.Block {
	trueBlk, falseBlk, exitBlk := cfg.NewIfBlock(block, llvmProg.LabelGen, block.ToForExit)
	llvmFunc := llvmProg.FuncDefs[currFunc.Name]
	llvmFunc.AddBlock(trueBlk.Label, trueBlk)
	llvmFunc.AddBlock(falseBlk.Label, falseBlk)
	llvmFunc.AddBlock(exitBlk.Label, exitBlk)
	cInstrs, cOperand := c.expr.ExprTranslateToLLVMStack(currFunc, llvmProg)
	block.AddInstructions(cInstrs)
	if cOperand.GetRegister() != nil && cOperand.GetRegister().Entry.Ty.String() != "i1" {
		truncRegName := llvmProg.RegisterGen()
		truncRegEntry := st.NewVarEntry(truncRegName, types.Int1Sig, st.LOCAL, c.Token)
		currFunc.Variables.Insert(truncRegName, truncRegEntry)
		truncReg := llvm.NewLLVMRegister(truncRegEntry)
		truncInstr := llvm.NewTrunc(truncReg, types.Int64Sig, cOperand, types.Int1Sig)
		cOperand = truncReg
		block.AddInstr(truncInstr)
	}
	selRegName := llvmProg.RegisterGen()
	SelRegEntry := st.NewVarEntry(selRegName, types.Int1Sig, st.LOCAL, c.Token)
	currFunc.Variables.Insert(selRegName, SelRegEntry)
	selReg := llvm.NewLLVMRegister(SelRegEntry)
	selInstr := llvm.NewSelect(selReg, types.Int1Sig, cOperand, types.Int1Sig, llvm.NewLLVMImmediate(1, types.Int1Sig), llvm.NewLLVMImmediate(0, types.Int1Sig))
	block.AddInstr(selInstr)
	brCondInstr := llvm.NewBrCond(selReg, trueBlk.Label, falseBlk.Label, llvm.EQ)
	block.AddInstr(brCondInstr)
	for _, stm := range c.ifblock.statements {
		trueBlk = stm.TranslateToLLVMStack(trueBlk, currFunc, llvmProg)
	}
	trueBrInstr := llvm.NewBr(exitBlk.Label)
	trueBlk.AddInstr(trueBrInstr)
	if c.elseblock != nil {
		for _, stm := range c.elseblock.statements {
			falseBlk = stm.TranslateToLLVMStack(falseBlk, currFunc, llvmProg)
		}
		falseBrInstr := llvm.NewBr(exitBlk.Label)
		falseBlk.AddInstr(falseBrInstr)
	} else {
		falseBrInstr := llvm.NewBr(exitBlk.Label)
		falseBlk.AddInstr(falseBrInstr)
	}
	return exitBlk
}
