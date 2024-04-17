// Code generated from java-escape by ANTLR 4.11.1. DO NOT EDIT.

package lexer

import (
	"fmt"
	"sync"
	"unicode"

	"github.com/antlr/antlr4/runtime/Go/antlr/v4"
)

// Suppress unused import error
var _ = fmt.Printf
var _ = sync.Once{}
var _ = unicode.IsLetter

type GoliteLexer struct {
	*antlr.BaseLexer
	channelNames []string
	modeNames    []string
	// TODO: EOF string
}

var golitelexerLexerStaticData struct {
	once                   sync.Once
	serializedATN          []int32
	channelNames           []string
	modeNames              []string
	literalNames           []string
	symbolicNames          []string
	ruleNames              []string
	predictionContextCache *antlr.PredictionContextCache
	atn                    *antlr.ATN
	decisionToDFA          []*antlr.DFA
}

func golitelexerLexerInit() {
	staticData := &golitelexerLexerStaticData
	staticData.channelNames = []string{
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN",
	}
	staticData.modeNames = []string{
		"DEFAULT_MODE",
	}
	staticData.literalNames = []string{
		"", "'+'", "'-'", "'='", "'*'", "'/'", "';'", "'int'", "'bool'", "'var'",
		"'func'", "'delete'", "'scan'", "'printf'", "'if'", "'else'", "'for'",
		"'return'", "'||'", "'&&'", "'=='", "'!='", "'<'", "'>'", "'<='", "'>='",
		"'!'", "'.'", "'new'", "'true'", "'false'", "'{'", "'}'", "'('", "')'",
		"','", "", "", "", "'struct'", "'nil'", "'type'",
	}
	staticData.symbolicNames = []string{
		"", "PLUS", "MINUS", "EQUALS", "ASTERISK", "FSLASH", "SEMICOLON", "INT",
		"BOOL", "VAR", "FUNC", "DELETE", "SCAN", "PRINTF", "IF", "ELSE", "FOR",
		"RETURN", "OR", "AND", "EQ", "NEQ", "LT", "GT", "LTE", "GTE", "NOT",
		"DOT", "NEW", "TRUE", "FALSE", "LBRACE", "RBRACE", "LPAREN", "RPAREN",
		"COMMA", "INTLIT", "STRINGLIT", "WS", "STRUCT", "NIL", "TYPEKEY", "ID",
		"COMMENT",
	}
	staticData.ruleNames = []string{
		"PLUS", "MINUS", "EQUALS", "ASTERISK", "FSLASH", "SEMICOLON", "INT",
		"BOOL", "VAR", "FUNC", "DELETE", "SCAN", "PRINTF", "IF", "ELSE", "FOR",
		"RETURN", "OR", "AND", "EQ", "NEQ", "LT", "GT", "LTE", "GTE", "NOT",
		"DOT", "NEW", "TRUE", "FALSE", "LBRACE", "RBRACE", "LPAREN", "RPAREN",
		"COMMA", "INTLIT", "STRINGLIT", "WS", "STRUCT", "NIL", "TYPEKEY", "ID",
		"COMMENT",
	}
	staticData.predictionContextCache = antlr.NewPredictionContextCache()
	staticData.serializedATN = []int32{
		4, 0, 43, 261, 6, -1, 2, 0, 7, 0, 2, 1, 7, 1, 2, 2, 7, 2, 2, 3, 7, 3, 2,
		4, 7, 4, 2, 5, 7, 5, 2, 6, 7, 6, 2, 7, 7, 7, 2, 8, 7, 8, 2, 9, 7, 9, 2,
		10, 7, 10, 2, 11, 7, 11, 2, 12, 7, 12, 2, 13, 7, 13, 2, 14, 7, 14, 2, 15,
		7, 15, 2, 16, 7, 16, 2, 17, 7, 17, 2, 18, 7, 18, 2, 19, 7, 19, 2, 20, 7,
		20, 2, 21, 7, 21, 2, 22, 7, 22, 2, 23, 7, 23, 2, 24, 7, 24, 2, 25, 7, 25,
		2, 26, 7, 26, 2, 27, 7, 27, 2, 28, 7, 28, 2, 29, 7, 29, 2, 30, 7, 30, 2,
		31, 7, 31, 2, 32, 7, 32, 2, 33, 7, 33, 2, 34, 7, 34, 2, 35, 7, 35, 2, 36,
		7, 36, 2, 37, 7, 37, 2, 38, 7, 38, 2, 39, 7, 39, 2, 40, 7, 40, 2, 41, 7,
		41, 2, 42, 7, 42, 1, 0, 1, 0, 1, 1, 1, 1, 1, 2, 1, 2, 1, 3, 1, 3, 1, 4,
		1, 4, 1, 5, 1, 5, 1, 6, 1, 6, 1, 6, 1, 6, 1, 7, 1, 7, 1, 7, 1, 7, 1, 7,
		1, 8, 1, 8, 1, 8, 1, 8, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 10, 1, 10, 1,
		10, 1, 10, 1, 10, 1, 10, 1, 10, 1, 11, 1, 11, 1, 11, 1, 11, 1, 11, 1, 12,
		1, 12, 1, 12, 1, 12, 1, 12, 1, 12, 1, 12, 1, 13, 1, 13, 1, 13, 1, 14, 1,
		14, 1, 14, 1, 14, 1, 14, 1, 15, 1, 15, 1, 15, 1, 15, 1, 16, 1, 16, 1, 16,
		1, 16, 1, 16, 1, 16, 1, 16, 1, 17, 1, 17, 1, 17, 1, 18, 1, 18, 1, 18, 1,
		19, 1, 19, 1, 19, 1, 20, 1, 20, 1, 20, 1, 21, 1, 21, 1, 22, 1, 22, 1, 23,
		1, 23, 1, 23, 1, 24, 1, 24, 1, 24, 1, 25, 1, 25, 1, 26, 1, 26, 1, 27, 1,
		27, 1, 27, 1, 27, 1, 28, 1, 28, 1, 28, 1, 28, 1, 28, 1, 29, 1, 29, 1, 29,
		1, 29, 1, 29, 1, 29, 1, 30, 1, 30, 1, 31, 1, 31, 1, 32, 1, 32, 1, 33, 1,
		33, 1, 34, 1, 34, 1, 35, 4, 35, 208, 8, 35, 11, 35, 12, 35, 209, 1, 36,
		1, 36, 5, 36, 214, 8, 36, 10, 36, 12, 36, 217, 9, 36, 1, 36, 1, 36, 1,
		37, 4, 37, 222, 8, 37, 11, 37, 12, 37, 223, 1, 37, 1, 37, 1, 38, 1, 38,
		1, 38, 1, 38, 1, 38, 1, 38, 1, 38, 1, 39, 1, 39, 1, 39, 1, 39, 1, 40, 1,
		40, 1, 40, 1, 40, 1, 40, 1, 41, 1, 41, 5, 41, 246, 8, 41, 10, 41, 12, 41,
		249, 9, 41, 1, 42, 1, 42, 1, 42, 1, 42, 5, 42, 255, 8, 42, 10, 42, 12,
		42, 258, 9, 42, 1, 42, 1, 42, 1, 215, 0, 43, 1, 1, 3, 2, 5, 3, 7, 4, 9,
		5, 11, 6, 13, 7, 15, 8, 17, 9, 19, 10, 21, 11, 23, 12, 25, 13, 27, 14,
		29, 15, 31, 16, 33, 17, 35, 18, 37, 19, 39, 20, 41, 21, 43, 22, 45, 23,
		47, 24, 49, 25, 51, 26, 53, 27, 55, 28, 57, 29, 59, 30, 61, 31, 63, 32,
		65, 33, 67, 34, 69, 35, 71, 36, 73, 37, 75, 38, 77, 39, 79, 40, 81, 41,
		83, 42, 85, 43, 1, 0, 5, 1, 0, 48, 57, 3, 0, 9, 10, 13, 13, 32, 32, 2,
		0, 65, 90, 97, 122, 3, 0, 48, 57, 65, 90, 97, 122, 2, 0, 10, 10, 13, 13,
		265, 0, 1, 1, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 5, 1, 0, 0, 0, 0, 7, 1, 0,
		0, 0, 0, 9, 1, 0, 0, 0, 0, 11, 1, 0, 0, 0, 0, 13, 1, 0, 0, 0, 0, 15, 1,
		0, 0, 0, 0, 17, 1, 0, 0, 0, 0, 19, 1, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 23,
		1, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 27, 1, 0, 0, 0, 0, 29, 1, 0, 0, 0, 0,
		31, 1, 0, 0, 0, 0, 33, 1, 0, 0, 0, 0, 35, 1, 0, 0, 0, 0, 37, 1, 0, 0, 0,
		0, 39, 1, 0, 0, 0, 0, 41, 1, 0, 0, 0, 0, 43, 1, 0, 0, 0, 0, 45, 1, 0, 0,
		0, 0, 47, 1, 0, 0, 0, 0, 49, 1, 0, 0, 0, 0, 51, 1, 0, 0, 0, 0, 53, 1, 0,
		0, 0, 0, 55, 1, 0, 0, 0, 0, 57, 1, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 61, 1,
		0, 0, 0, 0, 63, 1, 0, 0, 0, 0, 65, 1, 0, 0, 0, 0, 67, 1, 0, 0, 0, 0, 69,
		1, 0, 0, 0, 0, 71, 1, 0, 0, 0, 0, 73, 1, 0, 0, 0, 0, 75, 1, 0, 0, 0, 0,
		77, 1, 0, 0, 0, 0, 79, 1, 0, 0, 0, 0, 81, 1, 0, 0, 0, 0, 83, 1, 0, 0, 0,
		0, 85, 1, 0, 0, 0, 1, 87, 1, 0, 0, 0, 3, 89, 1, 0, 0, 0, 5, 91, 1, 0, 0,
		0, 7, 93, 1, 0, 0, 0, 9, 95, 1, 0, 0, 0, 11, 97, 1, 0, 0, 0, 13, 99, 1,
		0, 0, 0, 15, 103, 1, 0, 0, 0, 17, 108, 1, 0, 0, 0, 19, 112, 1, 0, 0, 0,
		21, 117, 1, 0, 0, 0, 23, 124, 1, 0, 0, 0, 25, 129, 1, 0, 0, 0, 27, 136,
		1, 0, 0, 0, 29, 139, 1, 0, 0, 0, 31, 144, 1, 0, 0, 0, 33, 148, 1, 0, 0,
		0, 35, 155, 1, 0, 0, 0, 37, 158, 1, 0, 0, 0, 39, 161, 1, 0, 0, 0, 41, 164,
		1, 0, 0, 0, 43, 167, 1, 0, 0, 0, 45, 169, 1, 0, 0, 0, 47, 171, 1, 0, 0,
		0, 49, 174, 1, 0, 0, 0, 51, 177, 1, 0, 0, 0, 53, 179, 1, 0, 0, 0, 55, 181,
		1, 0, 0, 0, 57, 185, 1, 0, 0, 0, 59, 190, 1, 0, 0, 0, 61, 196, 1, 0, 0,
		0, 63, 198, 1, 0, 0, 0, 65, 200, 1, 0, 0, 0, 67, 202, 1, 0, 0, 0, 69, 204,
		1, 0, 0, 0, 71, 207, 1, 0, 0, 0, 73, 211, 1, 0, 0, 0, 75, 221, 1, 0, 0,
		0, 77, 227, 1, 0, 0, 0, 79, 234, 1, 0, 0, 0, 81, 238, 1, 0, 0, 0, 83, 243,
		1, 0, 0, 0, 85, 250, 1, 0, 0, 0, 87, 88, 5, 43, 0, 0, 88, 2, 1, 0, 0, 0,
		89, 90, 5, 45, 0, 0, 90, 4, 1, 0, 0, 0, 91, 92, 5, 61, 0, 0, 92, 6, 1,
		0, 0, 0, 93, 94, 5, 42, 0, 0, 94, 8, 1, 0, 0, 0, 95, 96, 5, 47, 0, 0, 96,
		10, 1, 0, 0, 0, 97, 98, 5, 59, 0, 0, 98, 12, 1, 0, 0, 0, 99, 100, 5, 105,
		0, 0, 100, 101, 5, 110, 0, 0, 101, 102, 5, 116, 0, 0, 102, 14, 1, 0, 0,
		0, 103, 104, 5, 98, 0, 0, 104, 105, 5, 111, 0, 0, 105, 106, 5, 111, 0,
		0, 106, 107, 5, 108, 0, 0, 107, 16, 1, 0, 0, 0, 108, 109, 5, 118, 0, 0,
		109, 110, 5, 97, 0, 0, 110, 111, 5, 114, 0, 0, 111, 18, 1, 0, 0, 0, 112,
		113, 5, 102, 0, 0, 113, 114, 5, 117, 0, 0, 114, 115, 5, 110, 0, 0, 115,
		116, 5, 99, 0, 0, 116, 20, 1, 0, 0, 0, 117, 118, 5, 100, 0, 0, 118, 119,
		5, 101, 0, 0, 119, 120, 5, 108, 0, 0, 120, 121, 5, 101, 0, 0, 121, 122,
		5, 116, 0, 0, 122, 123, 5, 101, 0, 0, 123, 22, 1, 0, 0, 0, 124, 125, 5,
		115, 0, 0, 125, 126, 5, 99, 0, 0, 126, 127, 5, 97, 0, 0, 127, 128, 5, 110,
		0, 0, 128, 24, 1, 0, 0, 0, 129, 130, 5, 112, 0, 0, 130, 131, 5, 114, 0,
		0, 131, 132, 5, 105, 0, 0, 132, 133, 5, 110, 0, 0, 133, 134, 5, 116, 0,
		0, 134, 135, 5, 102, 0, 0, 135, 26, 1, 0, 0, 0, 136, 137, 5, 105, 0, 0,
		137, 138, 5, 102, 0, 0, 138, 28, 1, 0, 0, 0, 139, 140, 5, 101, 0, 0, 140,
		141, 5, 108, 0, 0, 141, 142, 5, 115, 0, 0, 142, 143, 5, 101, 0, 0, 143,
		30, 1, 0, 0, 0, 144, 145, 5, 102, 0, 0, 145, 146, 5, 111, 0, 0, 146, 147,
		5, 114, 0, 0, 147, 32, 1, 0, 0, 0, 148, 149, 5, 114, 0, 0, 149, 150, 5,
		101, 0, 0, 150, 151, 5, 116, 0, 0, 151, 152, 5, 117, 0, 0, 152, 153, 5,
		114, 0, 0, 153, 154, 5, 110, 0, 0, 154, 34, 1, 0, 0, 0, 155, 156, 5, 124,
		0, 0, 156, 157, 5, 124, 0, 0, 157, 36, 1, 0, 0, 0, 158, 159, 5, 38, 0,
		0, 159, 160, 5, 38, 0, 0, 160, 38, 1, 0, 0, 0, 161, 162, 5, 61, 0, 0, 162,
		163, 5, 61, 0, 0, 163, 40, 1, 0, 0, 0, 164, 165, 5, 33, 0, 0, 165, 166,
		5, 61, 0, 0, 166, 42, 1, 0, 0, 0, 167, 168, 5, 60, 0, 0, 168, 44, 1, 0,
		0, 0, 169, 170, 5, 62, 0, 0, 170, 46, 1, 0, 0, 0, 171, 172, 5, 60, 0, 0,
		172, 173, 5, 61, 0, 0, 173, 48, 1, 0, 0, 0, 174, 175, 5, 62, 0, 0, 175,
		176, 5, 61, 0, 0, 176, 50, 1, 0, 0, 0, 177, 178, 5, 33, 0, 0, 178, 52,
		1, 0, 0, 0, 179, 180, 5, 46, 0, 0, 180, 54, 1, 0, 0, 0, 181, 182, 5, 110,
		0, 0, 182, 183, 5, 101, 0, 0, 183, 184, 5, 119, 0, 0, 184, 56, 1, 0, 0,
		0, 185, 186, 5, 116, 0, 0, 186, 187, 5, 114, 0, 0, 187, 188, 5, 117, 0,
		0, 188, 189, 5, 101, 0, 0, 189, 58, 1, 0, 0, 0, 190, 191, 5, 102, 0, 0,
		191, 192, 5, 97, 0, 0, 192, 193, 5, 108, 0, 0, 193, 194, 5, 115, 0, 0,
		194, 195, 5, 101, 0, 0, 195, 60, 1, 0, 0, 0, 196, 197, 5, 123, 0, 0, 197,
		62, 1, 0, 0, 0, 198, 199, 5, 125, 0, 0, 199, 64, 1, 0, 0, 0, 200, 201,
		5, 40, 0, 0, 201, 66, 1, 0, 0, 0, 202, 203, 5, 41, 0, 0, 203, 68, 1, 0,
		0, 0, 204, 205, 5, 44, 0, 0, 205, 70, 1, 0, 0, 0, 206, 208, 7, 0, 0, 0,
		207, 206, 1, 0, 0, 0, 208, 209, 1, 0, 0, 0, 209, 207, 1, 0, 0, 0, 209,
		210, 1, 0, 0, 0, 210, 72, 1, 0, 0, 0, 211, 215, 5, 34, 0, 0, 212, 214,
		9, 0, 0, 0, 213, 212, 1, 0, 0, 0, 214, 217, 1, 0, 0, 0, 215, 216, 1, 0,
		0, 0, 215, 213, 1, 0, 0, 0, 216, 218, 1, 0, 0, 0, 217, 215, 1, 0, 0, 0,
		218, 219, 5, 34, 0, 0, 219, 74, 1, 0, 0, 0, 220, 222, 7, 1, 0, 0, 221,
		220, 1, 0, 0, 0, 222, 223, 1, 0, 0, 0, 223, 221, 1, 0, 0, 0, 223, 224,
		1, 0, 0, 0, 224, 225, 1, 0, 0, 0, 225, 226, 6, 37, 0, 0, 226, 76, 1, 0,
		0, 0, 227, 228, 5, 115, 0, 0, 228, 229, 5, 116, 0, 0, 229, 230, 5, 114,
		0, 0, 230, 231, 5, 117, 0, 0, 231, 232, 5, 99, 0, 0, 232, 233, 5, 116,
		0, 0, 233, 78, 1, 0, 0, 0, 234, 235, 5, 110, 0, 0, 235, 236, 5, 105, 0,
		0, 236, 237, 5, 108, 0, 0, 237, 80, 1, 0, 0, 0, 238, 239, 5, 116, 0, 0,
		239, 240, 5, 121, 0, 0, 240, 241, 5, 112, 0, 0, 241, 242, 5, 101, 0, 0,
		242, 82, 1, 0, 0, 0, 243, 247, 7, 2, 0, 0, 244, 246, 7, 3, 0, 0, 245, 244,
		1, 0, 0, 0, 246, 249, 1, 0, 0, 0, 247, 245, 1, 0, 0, 0, 247, 248, 1, 0,
		0, 0, 248, 84, 1, 0, 0, 0, 249, 247, 1, 0, 0, 0, 250, 251, 5, 47, 0, 0,
		251, 252, 5, 47, 0, 0, 252, 256, 1, 0, 0, 0, 253, 255, 8, 4, 0, 0, 254,
		253, 1, 0, 0, 0, 255, 258, 1, 0, 0, 0, 256, 254, 1, 0, 0, 0, 256, 257,
		1, 0, 0, 0, 257, 259, 1, 0, 0, 0, 258, 256, 1, 0, 0, 0, 259, 260, 6, 42,
		0, 0, 260, 86, 1, 0, 0, 0, 6, 0, 209, 215, 223, 247, 256, 1, 6, 0, 0,
	}
	deserializer := antlr.NewATNDeserializer(nil)
	staticData.atn = deserializer.Deserialize(staticData.serializedATN)
	atn := staticData.atn
	staticData.decisionToDFA = make([]*antlr.DFA, len(atn.DecisionToState))
	decisionToDFA := staticData.decisionToDFA
	for index, state := range atn.DecisionToState {
		decisionToDFA[index] = antlr.NewDFA(state, index)
	}
}

// GoliteLexerInit initializes any static state used to implement GoliteLexer. By default the
// static state used to implement the lexer is lazily initialized during the first call to
// NewGoliteLexer(). You can call this function if you wish to initialize the static state ahead
// of time.
func GoliteLexerInit() {
	staticData := &golitelexerLexerStaticData
	staticData.once.Do(golitelexerLexerInit)
}

// NewGoliteLexer produces a new lexer instance for the optional input antlr.CharStream.
func NewGoliteLexer(input antlr.CharStream) *GoliteLexer {
	GoliteLexerInit()
	l := new(GoliteLexer)
	l.BaseLexer = antlr.NewBaseLexer(input)
	staticData := &golitelexerLexerStaticData
	l.Interpreter = antlr.NewLexerATNSimulator(l, staticData.atn, staticData.decisionToDFA, staticData.predictionContextCache)
	l.channelNames = staticData.channelNames
	l.modeNames = staticData.modeNames
	l.RuleNames = staticData.ruleNames
	l.LiteralNames = staticData.literalNames
	l.SymbolicNames = staticData.symbolicNames
	l.GrammarFileName = "GoliteLexer.g4"
	// TODO: l.EOF = antlr.TokenEOF

	return l
}

// GoliteLexer tokens.
const (
	GoliteLexerPLUS      = 1
	GoliteLexerMINUS     = 2
	GoliteLexerEQUALS    = 3
	GoliteLexerASTERISK  = 4
	GoliteLexerFSLASH    = 5
	GoliteLexerSEMICOLON = 6
	GoliteLexerINT       = 7
	GoliteLexerBOOL      = 8
	GoliteLexerVAR       = 9
	GoliteLexerFUNC      = 10
	GoliteLexerDELETE    = 11
	GoliteLexerSCAN      = 12
	GoliteLexerPRINTF    = 13
	GoliteLexerIF        = 14
	GoliteLexerELSE      = 15
	GoliteLexerFOR       = 16
	GoliteLexerRETURN    = 17
	GoliteLexerOR        = 18
	GoliteLexerAND       = 19
	GoliteLexerEQ        = 20
	GoliteLexerNEQ       = 21
	GoliteLexerLT        = 22
	GoliteLexerGT        = 23
	GoliteLexerLTE       = 24
	GoliteLexerGTE       = 25
	GoliteLexerNOT       = 26
	GoliteLexerDOT       = 27
	GoliteLexerNEW       = 28
	GoliteLexerTRUE      = 29
	GoliteLexerFALSE     = 30
	GoliteLexerLBRACE    = 31
	GoliteLexerRBRACE    = 32
	GoliteLexerLPAREN    = 33
	GoliteLexerRPAREN    = 34
	GoliteLexerCOMMA     = 35
	GoliteLexerINTLIT    = 36
	GoliteLexerSTRINGLIT = 37
	GoliteLexerWS        = 38
	GoliteLexerSTRUCT    = 39
	GoliteLexerNIL       = 40
	GoliteLexerTYPEKEY   = 41
	GoliteLexerID        = 42
	GoliteLexerCOMMENT   = 43
)
