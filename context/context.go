package context

import (
	"fmt"
	"proj-optimization-overlords/token"
)

type CompilerPhase int

const (
	LEXER CompilerPhase = iota
	PARSER
	SEMANTIC
)

type CompilerError struct {
	Line   int           // The line where the error occurred
	Column int           // The column where the error occurred
	Msg    string        // A user friendly message to display
	Phase  CompilerPhase // The phase of the compiler were the error was generated
}

func NewCompilerError(token *token.Token, msg string, phase CompilerPhase) *CompilerError {
	return &CompilerError{token.Line, token.Column, msg, phase}
}

func (err *CompilerError) String() string {
	if err.Phase == LEXER {
		return fmt.Sprintf("lexer error(%d:%d): %s", err.Line, err.Column, err.Msg)
	} else if err.Phase == PARSER {
		return fmt.Sprintf("syntax error(%d,%d): %s", err.Line, err.Column, err.Msg)
	} else if err.Phase == SEMANTIC {
		return fmt.Sprintf("semantic error(%d,%d): %s", err.Line, err.Column, err.Msg)
	}
	panic("Invalid phase found")
}
func HasErrors(errs []*CompilerError) bool {
	if len(errs) > 0 {
		for _, e := range errs {
			fmt.Println(e)
		}
		return true
	}
	return false
}
