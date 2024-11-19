lexer grammar GoliteLexer; 

PLUS : '+';

MINUS : '-';

EQUALS : '=';

ASTERISK : '*';

FSLASH : '/';

SEMICOLON : ';';

INT : 'int';

BOOL : 'bool';

VAR : 'var';

FUNC : 'func';

DELETE : 'delete';

SCAN : 'scan';

PRINTF : 'printf';

IF : 'if';

ELSE : 'else';

FOR : 'for';

RETURN : 'return';

OR : '||';

AND : '&&';

EQ : '==';

NEQ : '!=';

LT : '<';

GT : '>';

LTE : '<=';

GTE : '>=';

NOT : '!';

DOT : '.';

NEW : 'new';

TRUE : 'true';

FALSE : 'false';

LBRACE : '{';

RBRACE : '}';

LPAREN : '(';

RPAREN : ')';

COMMA : ',';

INTLIT : [0-9]+;

STRINGLIT : '"' .*? '"';

WS : [ \t\r\n]+ -> skip;

STRUCT : 'struct';

NIL : 'nil';

TYPEKEY : 'type';

ID : [a-zA-Z][a-zA-Z0-9]*;

COMMENT : '//' ~[\r\n]* -> skip;
