package parser

import (
	"fmt"
	"proj-optimization-overlords/ast"
	"proj-optimization-overlords/context"
	"proj-optimization-overlords/lexer"
	"proj-optimization-overlords/token"
	"proj-optimization-overlords/types"
	"strconv"

	"github.com/antlr/antlr4/runtime/Go/antlr/v4"
)

type Parser interface {
	Parse() *ast.Program
	GetErrors() []*context.CompilerError
}

type parserWrapper struct {
	*antlr.DefaultErrorListener // Embed default which ensures we fit the interface
	*BaseGoliteParserListener
	antlrParser *GoliteParser
	lexer       lexer.Lexer
	errors      []*context.CompilerError
	nodes       map[string]interface{}
}

func (parser *parserWrapper) GetErrors() []*context.CompilerError {
	return parser.errors
}

func (parser *parserWrapper) SyntaxError(recognizer antlr.Recognizer, offendingSymbol interface{}, line, column int, msg string, e antlr.RecognitionException) {
	parser.errors = append(parser.errors, &context.CompilerError{
		Line:   line,
		Column: column,
		Msg:    msg,
		Phase:  context.PARSER,
	})
}

func NewParser(lexer lexer.Lexer) Parser {
	parser := &parserWrapper{antlr.NewDefaultErrorListener(), &BaseGoliteParserListener{}, nil, lexer, nil, make(map[string]interface{})}
	antlrParser := NewGoliteParser(lexer.GetTokenStream())
	antlrParser.RemoveErrorListeners()
	antlrParser.AddErrorListener(parser)
	parser.antlrParser = antlrParser
	return parser
}

func (parser *parserWrapper) Parse() *ast.Program {
	ctx := parser.antlrParser.Program()
	if context.HasErrors(parser.lexer.GetErrors()) ||
		context.HasErrors(parser.GetErrors()) {
		return nil
	}
	antlr.ParseTreeWalkerDefault.Walk(parser, ctx)
	_, _, key := GetTokenInfo(ctx)
	return parser.nodes[key].(*ast.Program)
}

/******************* Implementation of the Listeners **************************/

// GetTokenInfo gerates a unique key for each node in the ParserTree
func GetTokenInfo(ctx antlr.ParserRuleContext) (int, int, string) {
	key := fmt.Sprintf("%d,%d", ctx.GetStart().GetLine(), ctx.GetStart().GetColumn())
	return ctx.GetStart().GetLine(), ctx.GetStart().GetColumn(), key
}

func (parser *parserWrapper) ExitFactor(c *FactorContext) {
	line, col, key := GetTokenInfo(c)
	if intFactor := c.INTLIT(); intFactor != nil {
		intValue, _ := strconv.Atoi(intFactor.GetText())
		parser.nodes[key] = ast.NewIntLit(int64(intValue), token.NewToken(line, col))
	} else if trueFactor := c.TRUE(); trueFactor != nil {
		parser.nodes[key] = ast.NewBoolLit(true, token.NewToken(line, col))
	} else if falseFactor := c.FALSE(); falseFactor != nil {
		parser.nodes[key] = ast.NewBoolLit(false, token.NewToken(line, col))
	} else if nilFactor := c.NIL(); nilFactor != nil {
		parser.nodes[key] = ast.NewNil(token.NewToken(line, col))
	} else if newFactor := c.NEW(); newFactor != nil {
		idFactor := c.ID()
		variable := ast.NewVariableStm(idFactor.GetText(), token.NewToken(line, col))
		parser.nodes[key] = ast.NewNewStm(variable, token.NewToken(line, col))
	} else if idFactor := c.ID(); idFactor != nil {
		variable := ast.NewVariableStm(idFactor.GetText(), token.NewToken(line, col))
		if c.LPAREN() != nil {
			var args []ast.Expression
			for i, _ := range c.AllExpression() {
				_, _, exprKey := GetTokenInfo(c.Expression(i))
				arg := parser.nodes[exprKey].(ast.Expression)
				args = append(args, arg)
			}
			parser.nodes[key] = ast.NewInvocationStm(variable, args, token.NewToken(line, col))
		} else {
			parser.nodes[key] = variable
		}
	} else if lParenFactor := c.LPAREN(); lParenFactor != nil {
		_, _, eprKey := GetTokenInfo(c.Expression(0))
		parenExpr := ast.NewParenExpr(parser.nodes[eprKey].(ast.Expression), token.NewToken(line, col))
		parser.nodes[key] = parenExpr
	}
}

func (parser *parserWrapper) ExitSelectorTerm(c *SelectorTermContext) {
	line, col, key := GetTokenInfo(c)
	_, _, factorKey := GetTokenInfo(c.Factor())
	factor := parser.nodes[factorKey].(ast.Expression)
	var vars []*ast.Variable
	for i, _ := range c.AllID() {
		id := c.ID(i)
		v := ast.NewVariableStm(id.GetText(), token.NewToken(id.GetSymbol().GetLine(), id.GetSymbol().GetColumn()))
		vars = append(vars, v)
	}
	parser.nodes[key] = ast.NewFieldExprStm(factor, vars, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitUnaryTerm(c *UnaryTermContext) {
	line, col, key := GetTokenInfo(c)
	if unaryOp := c.MINUS(); unaryOp != nil {
		_, _, selectorTermKey := GetTokenInfo(c.SelectorTerm())
		selectorTerm := parser.nodes[selectorTermKey].(ast.Expression)
		parser.nodes[key] = ast.NewUnaryExprStm(ast.MINUS, selectorTerm, token.NewToken(line, col))
	} else if notOp := c.NOT(); notOp != nil {
		_, _, selectorTermKey := GetTokenInfo(c.SelectorTerm())
		selectorTerm := parser.nodes[selectorTermKey].(ast.Expression)
		parser.nodes[key] = ast.NewUnaryExprStm(ast.NOT, selectorTerm, token.NewToken(line, col))
	} else {
		_, _, selectorTermKey := GetTokenInfo(c.SelectorTerm())
		parser.nodes[key] = parser.nodes[selectorTermKey]
	}
}

func (parser *parserWrapper) ExitTerm(c *TermContext) {
	line, col, key := GetTokenInfo(c)
	_, _, unaryTermKey := GetTokenInfo(c.UnaryTerm(0))
	unaryTerm := parser.nodes[unaryTermKey].(ast.Expression)

	var rest []ast.Expression
	for _, exprCtx := range c.AllUnaryTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		rest = append(rest, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllAsteriskFSlash() {
		op := ast.StrToOp(c.AsteriskFSlash(i).GetText())
		ops = append(ops, op)
	}
	parser.nodes[key] = ast.NewBinaryExprStm(unaryTerm, rest[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitSimpleTerm(c *SimpleTermContext) {
	line, col, key := GetTokenInfo(c)
	var rest []ast.Expression
	for _, exprCtx := range c.AllTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		rest = append(rest, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllPlusMinus() {
		op := ast.StrToOp(c.PlusMinus(i).GetText())
		ops = append(ops, op)
	}
	parser.nodes[key] = ast.NewBinaryExprStm(rest[0], rest[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitRelationTerm(c *RelationTermContext) {
	line, col, key := GetTokenInfo(c)
	var rest []ast.Expression
	for _, exprCtx := range c.AllSimpleTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		rest = append(rest, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllGreaterLess() {
		op := ast.StrToOp(c.GreaterLess(i).GetText())
		ops = append(ops, op)
	}
	parser.nodes[key] = ast.NewBinaryExprStm(rest[0], rest[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitEqualTerm(c *EqualTermContext) {
	line, col, key := GetTokenInfo(c)
	var exprs []ast.Expression
	for _, exprCtx := range c.AllRelationTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		exprs = append(exprs, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllEqNeq() {
		op := ast.StrToOp(c.EqNeq(i).GetText())
		ops = append(ops, op)
	}
	parser.nodes[key] = ast.NewBinaryExprStm(exprs[0], exprs[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitBoolTerm(c *BoolTermContext) {
	line, col, key := GetTokenInfo(c)
	var exprs []ast.Expression
	for _, exprCtx := range c.AllEqualTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		exprs = append(exprs, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllAND() {
		op := ast.StrToOp(c.AND(i).GetText())
		ops = append(ops, op)
	}
	parser.nodes[key] = ast.NewBinaryExprStm(exprs[0], exprs[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitExpression(c *ExpressionContext) {
	line, col, key := GetTokenInfo(c)
	var exprs []ast.Expression
	for _, exprCtx := range c.AllBoolTerm() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		exprs = append(exprs, expr)
	}
	var ops []ast.Operator
	for i, _ := range c.AllOR() {
		op := ast.StrToOp(c.OR(i).GetText())
		ops = append(ops, op)
	}

	parser.nodes[key] = ast.NewBinaryExprStm(exprs[0], exprs[1:], ops, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitLValue(c *LValueContext) {
	line, col, key := GetTokenInfo(c)
	var vars []*ast.Variable
	for i, _ := range c.AllID() {
		id := c.ID(i)
		v := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
		vars = append(vars, v)
	}
	parser.nodes[key] = ast.NewLvalueStm(vars[0], vars[1:], token.NewToken(line, col))
}

func (parser *parserWrapper) ExitInvocation(c *InvocationContext) {
	line, col, key := GetTokenInfo(c)
	id := c.ID()
	variable := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
	var args []ast.Expression
	for _, exprCtx := range c.AllExpression() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		args = append(args, parser.nodes[exprKey].(ast.Expression))
	}
	parser.nodes[key] = ast.NewInvocationStm(variable, args, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitReturn(c *ReturnContext) {
	line, col, key := GetTokenInfo(c)
	if c.Expression() != nil {
		_, _, exprKey := GetTokenInfo(c.Expression())
		expr := parser.nodes[exprKey].(ast.Expression)
		parser.nodes[key] = ast.NewReturnStm(expr, token.NewToken(line, col))
	} else {
		parser.nodes[key] = ast.NewReturnStm(nil, token.NewToken(line, col))
	}
}

func (parser *parserWrapper) ExitLoop(c *LoopContext) {
	line, col, key := GetTokenInfo(c)
	_, _, exprKey := GetTokenInfo(c.Expression())
	expr := parser.nodes[exprKey].(ast.Expression)
	_, _, blockKey := GetTokenInfo(c.Block())
	block := parser.nodes[blockKey].(*ast.Block)
	parser.nodes[key] = ast.NewLoopStm(expr, block, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitConditional(c *ConditionalContext) {
	line, col, key := GetTokenInfo(c)
	_, _, exprKey := GetTokenInfo(c.Expression())
	expr := parser.nodes[exprKey].(ast.Expression)
	_, _, ifBlockKey := GetTokenInfo(c.Block(0))
	ifBlock := parser.nodes[ifBlockKey].(*ast.Block)
	if c.ELSE() != nil {
		_, _, elseBlockKey := GetTokenInfo(c.Block(1))
		elseBlock := parser.nodes[elseBlockKey].(*ast.Block)
		parser.nodes[key] = ast.NewConditionalStm(expr, ifBlock, elseBlock, token.NewToken(line, col))
	} else {
		parser.nodes[key] = ast.NewConditionalStm(expr, ifBlock, nil, token.NewToken(line, col))
	}
}

func (parser *parserWrapper) ExitPrint(c *PrintContext) {
	line, col, key := GetTokenInfo(c)
	strLit := c.STRINGLIT().GetText()
	var exprs []ast.Expression
	for _, exprCtx := range c.AllExpression() {
		_, _, exprKey := GetTokenInfo(exprCtx)
		expr := parser.nodes[exprKey].(ast.Expression)
		exprs = append(exprs, expr)
	}
	parser.nodes[key] = ast.NewPrintStm(strLit, exprs, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitAssignment(c *AssignmentContext) {
	line, col, key := GetTokenInfo(c)
	_, _, lValueKey := GetTokenInfo(c.LValue())
	lValue := parser.nodes[lValueKey].(*ast.LValue)
	_, _, exprKey := GetTokenInfo(c.Expression())
	expr := parser.nodes[exprKey].(ast.Expression)
	parser.nodes[key] = ast.NewAssignmentStm(lValue, expr, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitRead(c *ReadContext) {
	line, col, key := GetTokenInfo(c)
	_, _, lValueKey := GetTokenInfo(c.LValue())
	lValue := parser.nodes[lValueKey].(*ast.LValue)
	parser.nodes[key] = ast.NewReadStm(lValue, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitDelete(c *DeleteContext) {
	line, col, key := GetTokenInfo(c)
	_, _, exprKey := GetTokenInfo(c.Expression())
	expr := parser.nodes[exprKey].(ast.Expression)
	parser.nodes[key] = ast.NewDeleteStm(expr, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitBlock(c *BlockContext) {
	line, col, key := GetTokenInfo(c)
	var stms []ast.Statement
	for _, stmCtx := range c.AllStatement() {
		_, _, stmKey := GetTokenInfo(stmCtx)
		stm := parser.nodes[stmKey].(ast.Statement)
		stms = append(stms, stm)
	}
	parser.nodes[key] = ast.NewBlockStm(stms, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitStatement(c *StatementContext) {
	_, _, key := GetTokenInfo(c)
	if asmtCtx := c.Assignment(); asmtCtx != nil {
		_, _, asmtKey := GetTokenInfo(asmtCtx)
		parser.nodes[key] = parser.nodes[asmtKey]
	} else if printCtx := c.Print_(); printCtx != nil {
		_, _, printKey := GetTokenInfo(printCtx)
		parser.nodes[key] = parser.nodes[printKey]
	} else if readCtx := c.Read(); readCtx != nil {
		_, _, readKey := GetTokenInfo(readCtx)
		parser.nodes[key] = parser.nodes[readKey]
	} else if deleteCtx := c.Delete_(); deleteCtx != nil {
		_, _, deleteKey := GetTokenInfo(deleteCtx)
		parser.nodes[key] = parser.nodes[deleteKey]
	} else if condCtx := c.Conditional(); condCtx != nil {
		_, _, condKey := GetTokenInfo(condCtx)
		parser.nodes[key] = parser.nodes[condKey]
	} else if loopCtx := c.Loop(); loopCtx != nil {
		_, _, loopKey := GetTokenInfo(loopCtx)
		parser.nodes[key] = parser.nodes[loopKey]
	} else if retCtx := c.Return_(); retCtx != nil {
		_, _, retKey := GetTokenInfo(retCtx)
		parser.nodes[key] = parser.nodes[retKey]
	} else if readCtx := c.Read(); readCtx != nil {
		_, _, readKey := GetTokenInfo(readCtx)
		parser.nodes[key] = parser.nodes[readKey]
	} else if invCtx := c.Invocation(); invCtx != nil {
		_, _, invKey := GetTokenInfo(invCtx)
		parser.nodes[key] = parser.nodes[invKey]
	}
}

func (parser *parserWrapper) ExitFunction(c *FunctionContext) {
	line, col, key := GetTokenInfo(c)
	id := c.ID()
	variable := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
	var params []*ast.Decl
	for _, paramCtx := range c.AllDecl() {
		_, _, paramKey := GetTokenInfo(paramCtx)
		param := parser.nodes[paramKey].(*ast.Decl)
		params = append(params, param)
	}
	var ty = []*ast.ReturnType{}
	if c.ReturnType() != nil {
		_, _, typeKey := GetTokenInfo(c.ReturnType())
		ty = append(ty, parser.nodes[typeKey].(*ast.ReturnType))
	}
	var declars []*ast.Declaration
	for _, declarationCtx := range c.AllDeclaration() {
		_, _, declarationKey := GetTokenInfo(declarationCtx)
		declar := parser.nodes[declarationKey].(*ast.Declaration)
		declars = append(declars, declar)
	}
	var stms []ast.Statement
	for _, stmCtx := range c.AllStatement() {
		_, _, stmKey := GetTokenInfo(stmCtx)
		stm := parser.nodes[stmKey].(ast.Statement)
		stms = append(stms, stm)
	}
	parser.nodes[key] = ast.NewFunctionStm(variable, params, ty, declars, stms, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitDeclaration(c *DeclarationContext) {
	line, col, key := GetTokenInfo(c)
	var ids []*ast.Variable
	for i, _ := range c.AllID() {
		id := c.ID(i)
		variable := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
		ids = append(ids, variable)
	}
	_, _, typeKey := GetTokenInfo(c.Type_())
	ty := parser.nodes[typeKey].(*ast.TypeNode)
	parser.nodes[key] = ast.NewDeclarationStm(ids, ty, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitType(c *TypeContext) {
	line, col, key := GetTokenInfo(c)
	var ty types.Type
	if intType := c.INT(); intType != nil {
		ty = types.IntTySig
	} else if boolType := c.BOOL(); boolType != nil {
		ty = types.BoolTySig
	} else {
		ty = types.StringToType(c.ID().GetText())
	}
	parser.nodes[key] = ast.NewTypeNodeStm(ty, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitDecl(c *DeclContext) {
	line, col, key := GetTokenInfo(c)
	id := c.ID()
	variable := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
	_, _, typeKey := GetTokenInfo(c.Type_())
	ty := parser.nodes[typeKey].(*ast.TypeNode)
	parser.nodes[key] = ast.NewDeclStm(variable, ty, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitTypeDeclaration(c *TypeDeclarationContext) {
	line, col, key := GetTokenInfo(c)
	id := c.ID()
	variable := ast.NewVariableStm(id.GetText(), token.NewToken(line, col))
	var fields []*ast.Decl
	for _, declCtx := range c.AllDecl() {
		_, _, declKey := GetTokenInfo(declCtx)
		decl := parser.nodes[declKey].(*ast.Decl)
		fields = append(fields, decl)
	}
	parser.nodes[key] = ast.NewTypeDeclarationStm(variable, fields, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitProgram(c *ProgramContext) {
	line, col, key := GetTokenInfo(c)
	var typeDecls []*ast.TypeDeclaration
	for _, typeDeclCtx := range c.AllTypeDeclaration() {
		_, _, typeDeclKey := GetTokenInfo(typeDeclCtx)
		typeDecl := parser.nodes[typeDeclKey].(*ast.TypeDeclaration)
		typeDecls = append(typeDecls, typeDecl)
	}
	var declarations []*ast.Declaration
	for _, declarationCtx := range c.AllDeclaration() {
		_, _, declarationKey := GetTokenInfo(declarationCtx)
		declaration := parser.nodes[declarationKey].(*ast.Declaration)
		declarations = append(declarations, declaration)
	}
	var functions []*ast.Function
	for _, funcCtx := range c.AllFunction() {
		_, _, funcKey := GetTokenInfo(funcCtx)
		function := parser.nodes[funcKey].(*ast.Function)
		functions = append(functions, function)
	}
	parser.nodes[key] = ast.NewProgram(typeDecls, declarations, functions, token.NewToken(line, col))
}

func (parser *parserWrapper) ExitReturnType(c *ReturnTypeContext) {
	line, col, key := GetTokenInfo(c)
	_, _, typeKey := GetTokenInfo(c.Type_())
	ty := parser.nodes[typeKey].(*ast.TypeNode)
	parser.nodes[key] = ast.NewReturnTypeStm(ty, token.NewToken(line, col))
}
