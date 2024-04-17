// Code generated from java-escape by ANTLR 4.11.1. DO NOT EDIT.

package parser // GoliteParser
import "github.com/antlr/antlr4/runtime/Go/antlr/v4"

// GoliteParserListener is a complete listener for a parse tree produced by GoliteParser.
type GoliteParserListener interface {
	antlr.ParseTreeListener

	// EnterProgram is called when entering the program production.
	EnterProgram(c *ProgramContext)

	// EnterTypeDeclaration is called when entering the typeDeclaration production.
	EnterTypeDeclaration(c *TypeDeclarationContext)

	// EnterDecl is called when entering the decl production.
	EnterDecl(c *DeclContext)

	// EnterType is called when entering the type production.
	EnterType(c *TypeContext)

	// EnterDeclaration is called when entering the declaration production.
	EnterDeclaration(c *DeclarationContext)

	// EnterFunction is called when entering the function production.
	EnterFunction(c *FunctionContext)

	// EnterReturnType is called when entering the returnType production.
	EnterReturnType(c *ReturnTypeContext)

	// EnterStatement is called when entering the statement production.
	EnterStatement(c *StatementContext)

	// EnterBlock is called when entering the block production.
	EnterBlock(c *BlockContext)

	// EnterDelete is called when entering the delete production.
	EnterDelete(c *DeleteContext)

	// EnterRead is called when entering the read production.
	EnterRead(c *ReadContext)

	// EnterAssignment is called when entering the assignment production.
	EnterAssignment(c *AssignmentContext)

	// EnterPrint is called when entering the print production.
	EnterPrint(c *PrintContext)

	// EnterConditional is called when entering the conditional production.
	EnterConditional(c *ConditionalContext)

	// EnterLoop is called when entering the loop production.
	EnterLoop(c *LoopContext)

	// EnterReturn is called when entering the return production.
	EnterReturn(c *ReturnContext)

	// EnterInvocation is called when entering the invocation production.
	EnterInvocation(c *InvocationContext)

	// EnterLValue is called when entering the lValue production.
	EnterLValue(c *LValueContext)

	// EnterExpression is called when entering the expression production.
	EnterExpression(c *ExpressionContext)

	// EnterBoolTerm is called when entering the boolTerm production.
	EnterBoolTerm(c *BoolTermContext)

	// EnterEqualTerm is called when entering the equalTerm production.
	EnterEqualTerm(c *EqualTermContext)

	// EnterEqNeq is called when entering the eqNeq production.
	EnterEqNeq(c *EqNeqContext)

	// EnterRelationTerm is called when entering the relationTerm production.
	EnterRelationTerm(c *RelationTermContext)

	// EnterGreaterLess is called when entering the greaterLess production.
	EnterGreaterLess(c *GreaterLessContext)

	// EnterSimpleTerm is called when entering the simpleTerm production.
	EnterSimpleTerm(c *SimpleTermContext)

	// EnterPlusMinus is called when entering the plusMinus production.
	EnterPlusMinus(c *PlusMinusContext)

	// EnterTerm is called when entering the term production.
	EnterTerm(c *TermContext)

	// EnterAsteriskFSlash is called when entering the asteriskFSlash production.
	EnterAsteriskFSlash(c *AsteriskFSlashContext)

	// EnterUnaryTerm is called when entering the unaryTerm production.
	EnterUnaryTerm(c *UnaryTermContext)

	// EnterSelectorTerm is called when entering the selectorTerm production.
	EnterSelectorTerm(c *SelectorTermContext)

	// EnterFactor is called when entering the factor production.
	EnterFactor(c *FactorContext)

	// ExitProgram is called when exiting the program production.
	ExitProgram(c *ProgramContext)

	// ExitTypeDeclaration is called when exiting the typeDeclaration production.
	ExitTypeDeclaration(c *TypeDeclarationContext)

	// ExitDecl is called when exiting the decl production.
	ExitDecl(c *DeclContext)

	// ExitType is called when exiting the type production.
	ExitType(c *TypeContext)

	// ExitDeclaration is called when exiting the declaration production.
	ExitDeclaration(c *DeclarationContext)

	// ExitFunction is called when exiting the function production.
	ExitFunction(c *FunctionContext)

	// ExitReturnType is called when exiting the returnType production.
	ExitReturnType(c *ReturnTypeContext)

	// ExitStatement is called when exiting the statement production.
	ExitStatement(c *StatementContext)

	// ExitBlock is called when exiting the block production.
	ExitBlock(c *BlockContext)

	// ExitDelete is called when exiting the delete production.
	ExitDelete(c *DeleteContext)

	// ExitRead is called when exiting the read production.
	ExitRead(c *ReadContext)

	// ExitAssignment is called when exiting the assignment production.
	ExitAssignment(c *AssignmentContext)

	// ExitPrint is called when exiting the print production.
	ExitPrint(c *PrintContext)

	// ExitConditional is called when exiting the conditional production.
	ExitConditional(c *ConditionalContext)

	// ExitLoop is called when exiting the loop production.
	ExitLoop(c *LoopContext)

	// ExitReturn is called when exiting the return production.
	ExitReturn(c *ReturnContext)

	// ExitInvocation is called when exiting the invocation production.
	ExitInvocation(c *InvocationContext)

	// ExitLValue is called when exiting the lValue production.
	ExitLValue(c *LValueContext)

	// ExitExpression is called when exiting the expression production.
	ExitExpression(c *ExpressionContext)

	// ExitBoolTerm is called when exiting the boolTerm production.
	ExitBoolTerm(c *BoolTermContext)

	// ExitEqualTerm is called when exiting the equalTerm production.
	ExitEqualTerm(c *EqualTermContext)

	// ExitEqNeq is called when exiting the eqNeq production.
	ExitEqNeq(c *EqNeqContext)

	// ExitRelationTerm is called when exiting the relationTerm production.
	ExitRelationTerm(c *RelationTermContext)

	// ExitGreaterLess is called when exiting the greaterLess production.
	ExitGreaterLess(c *GreaterLessContext)

	// ExitSimpleTerm is called when exiting the simpleTerm production.
	ExitSimpleTerm(c *SimpleTermContext)

	// ExitPlusMinus is called when exiting the plusMinus production.
	ExitPlusMinus(c *PlusMinusContext)

	// ExitTerm is called when exiting the term production.
	ExitTerm(c *TermContext)

	// ExitAsteriskFSlash is called when exiting the asteriskFSlash production.
	ExitAsteriskFSlash(c *AsteriskFSlashContext)

	// ExitUnaryTerm is called when exiting the unaryTerm production.
	ExitUnaryTerm(c *UnaryTermContext)

	// ExitSelectorTerm is called when exiting the selectorTerm production.
	ExitSelectorTerm(c *SelectorTermContext)

	// ExitFactor is called when exiting the factor production.
	ExitFactor(c *FactorContext)
}
