parser grammar GoliteParser; 

options {
    tokenVocab = GoliteLexer;
}

// Program = Types Declarations Functions 'eof'                                                      ;
// Types = {TypeDeclaration}                                                                         ;
// TypeDeclaration = 'type' 'id' 'struct' '{' Fields '}' ';'                                         ;
// Fields = Decl ';' {Decl ';'}                                                                      ;
// Decl = 'id' Type                                                                                  ;
// Type = 'int' | 'bool' | '*' 'id'                                                                  ;
// Declarations = {Declaration}                                                                      ;
// Declaration = 'var' Ids Type ';'                                                                  ;
// Ids = 'id' {',' 'id'}                                                                             ;
// Functions = {Function}                                                                            ;
// Function = 'func' 'id' Parameters [ReturnType] '{' Declarations Statements '}'                    ;
// Parameters = '(' [ Decl {',' Decl}] ')'                                                           ;
// ReturnType = type                                                                                 ;
// Statements = {Statement}                                                                          ;
// Statement = Assignment | Print | Read |  Delete | Conditional | Loop | Return | Read | Invocation ;
// Block = '{' Statements '}'                                                                        ;
// Delete = 'delete' Expression ';'                                                                  ;
// Read = 'scan' LValue  ';'                                                                         ;
// Assignment = LValue '=' Expression  ';'                                                           ;
// Print = 'printf' '(' 'string' { ',' Expression} ')'  ';'                                          ;
// Conditional = 'if' '(' Expression ')' Block ['else' Block]                                        ;
// Loop = 'for' '(' Expression ')' Block                                                             ;
// Return = 'return' [Expression] ';'                                                                ;
// Invocation = 'id' Arguments ';'                                                                   ;
// Arguments = '(' [Expression {',' Expression}] ')'                                                 ;
// LValue = 'id' {'.' id}                                                                            ;
// Expression = BoolTerm {'||' BoolTerm}                                                             ;
// BoolTerm = EqualTerm {'&&' EqualTerm}                                                             ;
// EqualTerm =  RelationTerm {('=='| '!=') RelationTerm}                                             ;
// RelationTerm = SimpleTerm {('>'| '<' | '<=' | '>=') SimpleTerm}                                   ;
// SimpleTerm = Term {('+'| '-') Term}                                                               ;
// Term = UnaryTerm {('*'| '/') UnaryTerm}                                                           ;
// UnaryTerm = '!' SelectorTerm | '-' SelectorTerm | SelectorTerm                                    ;
// SelectorTerm = Factor {'.' 'id'}                                                                  ;
// Factor = '(' Expression ')' | 'id' [Arguments] | 'number' | 'new' id | 'true' | 'false' | 'nil'   ;

program: typeDeclaration* declaration* function* EOF;

typeDeclaration: TYPEKEY ID STRUCT LBRACE decl SEMICOLON (decl SEMICOLON)* RBRACE SEMICOLON;

decl: ID type;

type: INT | BOOL | ASTERISK ID;

declaration: VAR ID (COMMA ID)* type SEMICOLON;

function: FUNC ID LPAREN (decl (COMMA decl)*)? RPAREN returnType? LBRACE declaration* statement* RBRACE;

returnType: type;

statement: assignment | print | read | delete | conditional | loop | return | invocation;

block: LBRACE statement* RBRACE;

delete: DELETE expression SEMICOLON;

read: SCAN lValue SEMICOLON;

assignment: lValue EQUALS expression SEMICOLON;

print: PRINTF LPAREN STRINGLIT (COMMA expression)* RPAREN SEMICOLON;

conditional: IF LPAREN expression RPAREN block (ELSE block)?;

loop: FOR LPAREN expression RPAREN block;

return: RETURN expression? SEMICOLON;

invocation: ID LPAREN (expression (COMMA expression)*)? RPAREN SEMICOLON;

lValue: ID (DOT ID)*;

expression: boolTerm (OR boolTerm)*;

boolTerm: equalTerm (AND equalTerm)*;

equalTerm: relationTerm (eqNeq relationTerm)*;

eqNeq: EQ| NEQ;

relationTerm: simpleTerm (greaterLess simpleTerm)*;

greaterLess: GT| LT | LTE | GTE;

simpleTerm: term (plusMinus term)*;

plusMinus: PLUS| MINUS;

term: unaryTerm (asteriskFSlash unaryTerm)*;

asteriskFSlash: ASTERISK | FSLASH;

unaryTerm: NOT selectorTerm | MINUS selectorTerm | selectorTerm;

selectorTerm: factor (DOT ID)*;

factor: LPAREN expression RPAREN | ID (LPAREN (expression (COMMA expression)*)? RPAREN)? | INTLIT | NEW ID | TRUE | FALSE | NIL;