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

type BinaryExpr struct {
	*token.Token
	first Expression
	ops   []Operator
	rest  []Expression
}

func NewBinaryExprStm(first Expression, rest []Expression, ops []Operator, token *token.Token) *BinaryExpr {
	return &BinaryExpr{token, first, ops, rest}
}

func (be *BinaryExpr) String() string {
	var out bytes.Buffer
	out.WriteString(be.first.String())
	for i := 0; i < len(be.rest); i++ {
		out.WriteString(" " + opString(be.ops[i]) + " ") // operator
		out.WriteString(be.rest[i].String())             // right expression
	}
	return out.String()
}

func (be *BinaryExpr) GetType(function *st.FuncEntry, tables *st.SymbolTables) types.Type {
	first_type := be.first.GetType(function, tables)
	for i := 0; i < len(be.ops); i++ {
		next_type := be.rest[i].GetType(function, tables)
		if first_type.String() != next_type.String() && next_type != types.NilTySig && first_type != types.NilTySig {
			return types.UnknownTySig
		}
		// All arithmetic and relational operators require interger operands
		if be.ops[i] == PLUS || be.ops[i] == MINUS || be.ops[i] == ASTERISK || be.ops[i] == FSLASH {
			if next_type != types.IntTySig {
				return types.UnknownTySig
			}
			return types.IntTySig
		}
		if be.ops[i] == LT || be.ops[i] == GT || be.ops[i] == LTE || be.ops[i] == GTE {
			if next_type != types.IntTySig {
				return types.UnknownTySig
			}
			return types.BoolTySig
		}
		if be.ops[i] == EQ || be.ops[i] == NEQ {
			// check if be.rest[i] is a struct
			struct_entry := tables.Structs.Contains(be.rest[i].GetType(function, tables).String())
			if next_type != types.IntTySig && struct_entry == nil && next_type != types.NilTySig {
				return types.UnknownTySig
			}
			return types.BoolTySig
		}
		if be.ops[i] == AND || be.ops[i] == OR {
			if next_type != types.BoolTySig {
				return types.UnknownTySig
			}
			return types.BoolTySig
		}
	}
	return be.first.GetType(function, tables)
}

func (be *BinaryExpr) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	num_errors := len(errors)
	errors = be.first.TypeCheck(errors, function, tables)
	for i := 0; i < len(be.rest); i++ {
		errors = be.rest[i].TypeCheck(errors, function, tables)
	}
	if num_errors == len(errors) {
		errors = be.ValidateBin(errors, function, tables)
	}
	return errors
}

func (be *BinaryExpr) ValidateBin(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	first_type := be.first.GetType(function, tables)
	for i := 0; i < len(be.ops); i++ {
		next_type := be.rest[i].GetType(function, tables)
		if first_type.String() != next_type.String() && next_type != types.NilTySig && first_type != types.NilTySig {
			errors = append(errors, ct.NewCompilerError(be.Token, "left-operand of type \""+
				be.first.GetType(function, tables).String()+"\" does not match right-operand of type \""+
				be.rest[i].GetType(function, tables).String()+"\"", ct.SEMANTIC))
		}
		// All arithmetic and relational operators require interger operands
		if be.ops[i] == PLUS || be.ops[i] == MINUS || be.ops[i] == ASTERISK || be.ops[i] == FSLASH ||
			be.ops[i] == LT || be.ops[i] == GT || be.ops[i] == LTE || be.ops[i] == GTE {
			if next_type != types.IntTySig {
				errors = append(errors, ct.NewCompilerError(be.Token, "\""+opString(be.ops[i])+
					"\" operator requires int type but right operand has type "+
					be.rest[i].GetType(function, tables).String(), ct.SEMANTIC))
			}
		}
		if be.ops[i] == EQ || be.ops[i] == NEQ {
			// check if be.rest[i] is a struct
			struct_entry := tables.Structs.Contains(be.rest[i].GetType(function, tables).String())
			if next_type != types.IntTySig && struct_entry == nil && next_type != types.NilTySig {
				errors = append(errors, ct.NewCompilerError(be.Token, "\""+opString(be.ops[i])+
					"\" operator requires int or struct type but right operand has type "+
					be.rest[i].GetType(function, tables).String(), ct.SEMANTIC))
			}
		}
		if be.ops[i] == AND || be.ops[i] == OR {
			if next_type != types.BoolTySig {
				errors = append(errors, ct.NewCompilerError(be.Token, "\""+opString(be.ops[i])+
					"\" operator requires bool type but right operand has type "+
					be.rest[i].GetType(function, tables).String(), ct.SEMANTIC))
			}
		}
	}
	return errors
}

func (be *BinaryExpr) ExprTranslateToLLVMStack(currFunc *st.FuncEntry, program *llvm.LLVMProgram) ([]cfg.Instruction, llvm.LLVMOperand) {
	var instructions []cfg.Instruction
	firstInstrs, firstOperand := be.first.ExprTranslateToLLVMStack(currFunc, program)
	instructions = append(instructions, firstInstrs...)
	currReg := firstOperand
	for i := 0; i < len(be.rest); i++ {
		restInstrs, restOperand := be.rest[i].ExprTranslateToLLVMStack(currFunc, program)
		instructions = append(instructions, restInstrs...)
		var selectReg *llvm.LLVMRegister
		var restSelRegNum string
		if be.ops[i].IsBoolOp() {
			regNum := program.RegisterGen()
			selectVarEntry := st.NewVarEntry(regNum, types.Int64Sig, st.LOCAL, be.Token)
			currFunc.Variables.Insert(regNum, selectVarEntry)
			selectReg = llvm.NewLLVMRegister(selectVarEntry)
			if restOperand.GetType() != types.Int64Sig {
				restSelRegNum = program.RegisterGen()
			}
		}
		regNum := program.RegisterGen()
		var binOpReg *llvm.LLVMRegister
		if be.ops[i].IsComparison() {
			binOpEntry := st.NewVarEntry(regNum, types.Int1Sig, st.LOCAL, be.Token)
			currFunc.Variables.Insert(regNum, binOpEntry)
			binOpReg = llvm.NewLLVMRegister(binOpEntry)
			icmpInstr := llvm.NewICMP(binOpReg, be.ops[i].ToLLVMCondCode(), currReg.GetType(), currReg, restOperand)
			instructions = append(instructions, icmpInstr)
		} else {
			binOpEntry := st.NewVarEntry(regNum, types.Int64Sig, st.LOCAL, be.Token)
			currFunc.Variables.Insert(regNum, binOpEntry)
			binOpReg = llvm.NewLLVMRegister(binOpEntry)
			if be.ops[i].IsBoolOp() {
				if currReg.GetType() != types.Int64Sig {
					selectInstr := llvm.NewSelect(selectReg, types.Int1Sig, currReg, types.Int64Sig, llvm.NewLLVMImmediate(1, types.Int64Sig), llvm.NewLLVMImmediate(0, types.Int64Sig))
					instructions = append(instructions, selectInstr)
					currReg = selectReg
				}
				if restOperand.GetType() != types.Int64Sig {
					restSelVarEntry := st.NewVarEntry(restSelRegNum, types.Int64Sig, st.LOCAL, be.Token)
					currFunc.Variables.Insert(restSelRegNum, restSelVarEntry)
					restSelReg := llvm.NewLLVMRegister(restSelVarEntry)
					restSelInstr := llvm.NewSelect(restSelReg, types.Int1Sig, restOperand, types.Int64Sig, llvm.NewLLVMImmediate(1, types.Int64Sig), llvm.NewLLVMImmediate(0, types.Int64Sig))
					instructions = append(instructions, restSelInstr)
					restOperand = restSelReg
				}
			}
			binOpInstr := llvm.NewBinOp(binOpReg, be.ops[i].ToLLVMBinOpTy(), types.Int64Sig, currReg, restOperand)
			instructions = append(instructions, binOpInstr)
		}
		currReg = binOpReg
	}
	return instructions, currReg
}
