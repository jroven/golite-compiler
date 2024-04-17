package ast

import (
	"bytes"
	"proj-optimization-overlords/cfg"
	ct "proj-optimization-overlords/context"
	"proj-optimization-overlords/llvm"
	st "proj-optimization-overlords/symboltable"
	"proj-optimization-overlords/token"
	"strconv"
	"strings"
)

type Print struct {
	*token.Token
	stringlit string
	exprs     []Expression
}

func NewPrintStm(stringlit string, exprs []Expression, token *token.Token) *Print {
	return &Print{token, stringlit, exprs}
}

func (p *Print) String() string {
	var out bytes.Buffer

	out.WriteString("printf(")   // PRINTF LPAREN
	out.WriteString(p.stringlit) // STRINGLIT
	for _, expr := range p.exprs {
		out.WriteString(",")           // COMMA
		out.WriteString(expr.String()) // expression
	}
	out.WriteString(");") // RPAREN SEMICOLON

	return out.String()
}

func (p *Print) TypeCheck(errors []*ct.CompilerError, function *st.FuncEntry, tables *st.SymbolTables) []*ct.CompilerError {
	for _, expr := range p.exprs {
		if expr.GetType(function, tables).String() != "int" {
			errors = append(errors, ct.NewCompilerError(p.Token,
				"Print statement can only print integer values.", ct.SEMANTIC))
		}
	}
	num_placeholders := strings.Count(p.stringlit, "%d")
	if num_placeholders != len(p.exprs) {
		errors = append(errors, ct.NewCompilerError(p.Token,
			"found "+strconv.Itoa(num_placeholders)+" placeholders but only got "+
				strconv.Itoa(len(p.exprs))+" arguments", ct.SEMANTIC))
	}
	return errors
}

func (p *Print) ReturnCheck() bool {
	return false
}

func formatString(s string) (string, int) {
	var globalString bytes.Buffer
	i := 1
	strLen := len(s) - 2
	for i < len(s)-1 {
		switch c := s[i]; c {
		case '\\':
			if i+1 < len(s) && s[i+1] == 'n' {
				globalString.WriteString(`\0A`)
				i++
				strLen--
			} else {
				globalString.WriteString(`\`)
			}
		case '%':
			if i+1 < len(s) && s[i+1] == 'd' {
				globalString.WriteString(`%ld`)
				i++
				strLen++
			} else {
				globalString.WriteString(`%`)
			}
		default:
			globalString.WriteByte(c)
		}
		i++
	}
	globalString.WriteString(`\00`)
	strLen++
	return globalString.String(), strLen
}

func (p *Print) TranslateToLLVMStack(block *cfg.Block, currFunc *st.FuncEntry, program *llvm.LLVMProgram) *cfg.Block {
	globalString, strLen := formatString(p.stringlit)
	program.FmtStrs = append(program.FmtStrs, globalString)
	program.FmtStrLengths = append(program.FmtStrLengths, strLen)
	printfInstr := llvm.NewPrintf(p.stringlit, program.FmtStrCounter, []llvm.LLVMOperand{})
	program.FmtStrCounter++
	for _, expr := range p.exprs {
		instrs, operand := expr.ExprTranslateToLLVMStack(currFunc, program)
		block.AddInstructions(instrs)
		printfInstr.Flags = append(printfInstr.Flags, operand)
	}
	block.AddInstr(printfInstr)
	return block
}
