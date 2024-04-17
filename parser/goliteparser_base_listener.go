// Code generated from java-escape by ANTLR 4.11.1. DO NOT EDIT.

package parser // GoliteParser
import "github.com/antlr/antlr4/runtime/Go/antlr/v4"

// BaseGoliteParserListener is a complete listener for a parse tree produced by GoliteParser.
type BaseGoliteParserListener struct{}

var _ GoliteParserListener = &BaseGoliteParserListener{}

// VisitTerminal is called when a terminal node is visited.
func (s *BaseGoliteParserListener) VisitTerminal(node antlr.TerminalNode) {}

// VisitErrorNode is called when an error node is visited.
func (s *BaseGoliteParserListener) VisitErrorNode(node antlr.ErrorNode) {}

// EnterEveryRule is called when any rule is entered.
func (s *BaseGoliteParserListener) EnterEveryRule(ctx antlr.ParserRuleContext) {}

// ExitEveryRule is called when any rule is exited.
func (s *BaseGoliteParserListener) ExitEveryRule(ctx antlr.ParserRuleContext) {}

// EnterProgram is called when production program is entered.
func (s *BaseGoliteParserListener) EnterProgram(ctx *ProgramContext) {}

// ExitProgram is called when production program is exited.
func (s *BaseGoliteParserListener) ExitProgram(ctx *ProgramContext) {}

// EnterTypeDeclaration is called when production typeDeclaration is entered.
func (s *BaseGoliteParserListener) EnterTypeDeclaration(ctx *TypeDeclarationContext) {}

// ExitTypeDeclaration is called when production typeDeclaration is exited.
func (s *BaseGoliteParserListener) ExitTypeDeclaration(ctx *TypeDeclarationContext) {}

// EnterDecl is called when production decl is entered.
func (s *BaseGoliteParserListener) EnterDecl(ctx *DeclContext) {}

// ExitDecl is called when production decl is exited.
func (s *BaseGoliteParserListener) ExitDecl(ctx *DeclContext) {}

// EnterType is called when production type is entered.
func (s *BaseGoliteParserListener) EnterType(ctx *TypeContext) {}

// ExitType is called when production type is exited.
func (s *BaseGoliteParserListener) ExitType(ctx *TypeContext) {}

// EnterDeclaration is called when production declaration is entered.
func (s *BaseGoliteParserListener) EnterDeclaration(ctx *DeclarationContext) {}

// ExitDeclaration is called when production declaration is exited.
func (s *BaseGoliteParserListener) ExitDeclaration(ctx *DeclarationContext) {}

// EnterFunction is called when production function is entered.
func (s *BaseGoliteParserListener) EnterFunction(ctx *FunctionContext) {}

// ExitFunction is called when production function is exited.
func (s *BaseGoliteParserListener) ExitFunction(ctx *FunctionContext) {}

// EnterReturnType is called when production returnType is entered.
func (s *BaseGoliteParserListener) EnterReturnType(ctx *ReturnTypeContext) {}

// ExitReturnType is called when production returnType is exited.
func (s *BaseGoliteParserListener) ExitReturnType(ctx *ReturnTypeContext) {}

// EnterStatement is called when production statement is entered.
func (s *BaseGoliteParserListener) EnterStatement(ctx *StatementContext) {}

// ExitStatement is called when production statement is exited.
func (s *BaseGoliteParserListener) ExitStatement(ctx *StatementContext) {}

// EnterBlock is called when production block is entered.
func (s *BaseGoliteParserListener) EnterBlock(ctx *BlockContext) {}

// ExitBlock is called when production block is exited.
func (s *BaseGoliteParserListener) ExitBlock(ctx *BlockContext) {}

// EnterDelete is called when production delete is entered.
func (s *BaseGoliteParserListener) EnterDelete(ctx *DeleteContext) {}

// ExitDelete is called when production delete is exited.
func (s *BaseGoliteParserListener) ExitDelete(ctx *DeleteContext) {}

// EnterRead is called when production read is entered.
func (s *BaseGoliteParserListener) EnterRead(ctx *ReadContext) {}

// ExitRead is called when production read is exited.
func (s *BaseGoliteParserListener) ExitRead(ctx *ReadContext) {}

// EnterAssignment is called when production assignment is entered.
func (s *BaseGoliteParserListener) EnterAssignment(ctx *AssignmentContext) {}

// ExitAssignment is called when production assignment is exited.
func (s *BaseGoliteParserListener) ExitAssignment(ctx *AssignmentContext) {}

// EnterPrint is called when production print is entered.
func (s *BaseGoliteParserListener) EnterPrint(ctx *PrintContext) {}

// ExitPrint is called when production print is exited.
func (s *BaseGoliteParserListener) ExitPrint(ctx *PrintContext) {}

// EnterConditional is called when production conditional is entered.
func (s *BaseGoliteParserListener) EnterConditional(ctx *ConditionalContext) {}

// ExitConditional is called when production conditional is exited.
func (s *BaseGoliteParserListener) ExitConditional(ctx *ConditionalContext) {}

// EnterLoop is called when production loop is entered.
func (s *BaseGoliteParserListener) EnterLoop(ctx *LoopContext) {}

// ExitLoop is called when production loop is exited.
func (s *BaseGoliteParserListener) ExitLoop(ctx *LoopContext) {}

// EnterReturn is called when production return is entered.
func (s *BaseGoliteParserListener) EnterReturn(ctx *ReturnContext) {}

// ExitReturn is called when production return is exited.
func (s *BaseGoliteParserListener) ExitReturn(ctx *ReturnContext) {}

// EnterInvocation is called when production invocation is entered.
func (s *BaseGoliteParserListener) EnterInvocation(ctx *InvocationContext) {}

// ExitInvocation is called when production invocation is exited.
func (s *BaseGoliteParserListener) ExitInvocation(ctx *InvocationContext) {}

// EnterLValue is called when production lValue is entered.
func (s *BaseGoliteParserListener) EnterLValue(ctx *LValueContext) {}

// ExitLValue is called when production lValue is exited.
func (s *BaseGoliteParserListener) ExitLValue(ctx *LValueContext) {}

// EnterExpression is called when production expression is entered.
func (s *BaseGoliteParserListener) EnterExpression(ctx *ExpressionContext) {}

// ExitExpression is called when production expression is exited.
func (s *BaseGoliteParserListener) ExitExpression(ctx *ExpressionContext) {}

// EnterBoolTerm is called when production boolTerm is entered.
func (s *BaseGoliteParserListener) EnterBoolTerm(ctx *BoolTermContext) {}

// ExitBoolTerm is called when production boolTerm is exited.
func (s *BaseGoliteParserListener) ExitBoolTerm(ctx *BoolTermContext) {}

// EnterEqualTerm is called when production equalTerm is entered.
func (s *BaseGoliteParserListener) EnterEqualTerm(ctx *EqualTermContext) {}

// ExitEqualTerm is called when production equalTerm is exited.
func (s *BaseGoliteParserListener) ExitEqualTerm(ctx *EqualTermContext) {}

// EnterEqNeq is called when production eqNeq is entered.
func (s *BaseGoliteParserListener) EnterEqNeq(ctx *EqNeqContext) {}

// ExitEqNeq is called when production eqNeq is exited.
func (s *BaseGoliteParserListener) ExitEqNeq(ctx *EqNeqContext) {}

// EnterRelationTerm is called when production relationTerm is entered.
func (s *BaseGoliteParserListener) EnterRelationTerm(ctx *RelationTermContext) {}

// ExitRelationTerm is called when production relationTerm is exited.
func (s *BaseGoliteParserListener) ExitRelationTerm(ctx *RelationTermContext) {}

// EnterGreaterLess is called when production greaterLess is entered.
func (s *BaseGoliteParserListener) EnterGreaterLess(ctx *GreaterLessContext) {}

// ExitGreaterLess is called when production greaterLess is exited.
func (s *BaseGoliteParserListener) ExitGreaterLess(ctx *GreaterLessContext) {}

// EnterSimpleTerm is called when production simpleTerm is entered.
func (s *BaseGoliteParserListener) EnterSimpleTerm(ctx *SimpleTermContext) {}

// ExitSimpleTerm is called when production simpleTerm is exited.
func (s *BaseGoliteParserListener) ExitSimpleTerm(ctx *SimpleTermContext) {}

// EnterPlusMinus is called when production plusMinus is entered.
func (s *BaseGoliteParserListener) EnterPlusMinus(ctx *PlusMinusContext) {}

// ExitPlusMinus is called when production plusMinus is exited.
func (s *BaseGoliteParserListener) ExitPlusMinus(ctx *PlusMinusContext) {}

// EnterTerm is called when production term is entered.
func (s *BaseGoliteParserListener) EnterTerm(ctx *TermContext) {}

// ExitTerm is called when production term is exited.
func (s *BaseGoliteParserListener) ExitTerm(ctx *TermContext) {}

// EnterAsteriskFSlash is called when production asteriskFSlash is entered.
func (s *BaseGoliteParserListener) EnterAsteriskFSlash(ctx *AsteriskFSlashContext) {}

// ExitAsteriskFSlash is called when production asteriskFSlash is exited.
func (s *BaseGoliteParserListener) ExitAsteriskFSlash(ctx *AsteriskFSlashContext) {}

// EnterUnaryTerm is called when production unaryTerm is entered.
func (s *BaseGoliteParserListener) EnterUnaryTerm(ctx *UnaryTermContext) {}

// ExitUnaryTerm is called when production unaryTerm is exited.
func (s *BaseGoliteParserListener) ExitUnaryTerm(ctx *UnaryTermContext) {}

// EnterSelectorTerm is called when production selectorTerm is entered.
func (s *BaseGoliteParserListener) EnterSelectorTerm(ctx *SelectorTermContext) {}

// ExitSelectorTerm is called when production selectorTerm is exited.
func (s *BaseGoliteParserListener) ExitSelectorTerm(ctx *SelectorTermContext) {}

// EnterFactor is called when production factor is entered.
func (s *BaseGoliteParserListener) EnterFactor(ctx *FactorContext) {}

// ExitFactor is called when production factor is exited.
func (s *BaseGoliteParserListener) ExitFactor(ctx *FactorContext) {}
