grammar pascal;

start     : 'program' ID ';' 'var' decl_list main_code EOF ;

decl_list : decl | decl decl_list ;
decl      : ID ':' 'integer' ';' | ID ',' decl ;

main_code : 'begin' st_list 'end' '.' ;
code_block: statement | 'begin' st_list 'end' ;
st_list   : statement ';' | statement ';' st_list ;
block  	  : statement ';' | st_list ;

statement : assign | branch | out | in | redo ;

redo	  : 'repeat' block 'until' relation ;
assign    : ID ':=' expr | ID ':=' arit | ID ',' assign ;
in        : 'readln' LPARENT ID RPARENT | 'readln' LPARENT arit RPARENT | 'read' LPARENT ID RPARENT
          | 'read' LPARENT arit RPARENT | 'readln' ;
out       : 'writeln' LPARENT expr RPARENT
          | 'writeln' LPARENT string RPARENT | 'write' LPARENT expr RPARENT | 'write' LPARENT string RPARENT 
	  | 'writeln' LPARENT string ',' expr RPARENT | 'write' LPARENT string ',' expr RPARENT
	  | 'writeln' LPARENT arit RPARENT | 'write' LPARENT arit RPARENT | 'writeln' LPARENT string ',' arit RPARENT
	  | 'write' LPARENT string ',' arit RPARENT ;
branch    : 'if' relation 'then' code_block
          | 'if' relation 'then' code_block 'else' code_block ;
expr      : NUMBER | ID ;
fact      : expr | arit ;
relation  : fact LT fact | fact LEQ fact | fact EQ fact
          | fact NEQ fact | fact GEQ fact | fact GT fact
          | LPARENT relation RPARENT ;
arit 	  : expr PLUS expr | expr MINUS expr | expr MOD expr
          | expr PER expr | expr DIV expr | expr PLUS LPARENT arit RPARENT
          | expr MINUS LPARENT arit RPARENT | expr MOD LPARENT arit RPARENT
          | expr PER LPARENT arit RPARENT | expr DIV LPARENT arit RPARENT
          | LPARENT arit RPARENT PLUS expr | LPARENT arit RPARENT MINUS expr
          | LPARENT arit RPARENT MOD expr | LPARENT arit RPARENT PER expr
          | LPARENT arit RPARENT DIV expr | expr LPARENT arit RPARENT ;

boolean   : relation AND relation | relation OR relation
          | NOT LPARENT relation RPARENT | NOT LPARENT boolean RPARENT
	  | LPARENT relation RPARENT AND LPARENT relation RPARENT
	  | LPARENT relation RPARENT OR LPARENT relation RPARENT
          | LPARENT boolean RPARENT ;

string    : '\'' .*? '\'' ;

LPARENT   : '(' ;
RPARENT   : ')' ;

PLUS 	  : '+' ;
MINUS     : '-' ;
MOD  	  : '%' ;
PER 	  : '*' ;
DIV	      : '/' ;

AND       : 'and' ;
OR	      : 'or' ;
NOT	      : 'not' ;

EQ        : '=' ;
LT        : '<' ;
LEQ       : '<=' ;
GT        : '>' ;
GEQ       : '>=' ;
NEQ       : '<>' ;
ID        : [a-z]+ ;
NUMBER    : [0-9]+ ;
R_COMMENT : '(*' .*? '*)' -> skip ;     // .*? matches anything until the first */
C_COMMENT : '{' .*? '}' -> skip ;       // .*? matches anything until the first }
LINE_COMMENT : '//' ~[\r\n]* -> skip ;  // ~[\r\n]* matches anything but \r and \n
WS        : [ \n\t\r]+ -> skip;
ErrorChar : . ;
