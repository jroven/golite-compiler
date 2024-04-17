package lexer

import (
	"proj-optimization-overlords/context"

	"github.com/antlr/antlr4/runtime/Go/antlr/v4"
)

type Lexer interface {
	GetTokenStream() *antlr.CommonTokenStream
	GetErrors() []*context.CompilerError
}

type lexerWrapper struct {
	*antlr.DefaultErrorListener
	errors     []*context.CompilerError
	antrlLexer *GoliteLexer
	stream     *antlr.CommonTokenStream
}

func (lexer *lexerWrapper) GetTokenStream() *antlr.CommonTokenStream {
	return lexer.stream
}

func (lexer *lexerWrapper) GetErrors() []*context.CompilerError {
	return lexer.errors
}

func (lex *lexerWrapper) SyntaxError(recognizer antlr.Recognizer, offendingSymbol interface{}, line, column int, msg string, e antlr.RecognitionException) {
	lex.errors = append(lex.errors, &context.CompilerError{
		Line:   line,
		Column: column,
		Msg:    msg,
		Phase:  context.LEXER,
	})
}

func NewLexer(inputSourcePath string) Lexer {
	input, _ := antlr.NewFileStream(inputSourcePath)
	lexer := &lexerWrapper{antlr.NewDefaultErrorListener(), nil, nil, nil}
	antlrLexer := NewGoliteLexer(input)
	antlrLexer.RemoveErrorListeners()
	antlrLexer.AddErrorListener(lexer)
	tokenStream := antlr.NewCommonTokenStream(antlrLexer, 0)
	lexer.antrlLexer = antlrLexer
	lexer.stream = tokenStream
	return lexer
}
