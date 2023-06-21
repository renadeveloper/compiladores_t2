/* EQUIPE FORMADA POR RENATA LIMA RIBEIRO DE SENA, RODRIGO CERQUEIRA SANTOS MOREIRA E JOAO VICTOR DE ARAUJO SANTANA BOMFIM */ 
/* Nome da Equipe: Renata-Joâo-Rodrigo */ 


%{
#include <stdio.h>
#include <stdlib.h>
#include "token.h"

/* interface to lexer */
 
extern int yylineno; /* from lexer */
void yyerror(char *s, ...);
int yylex();
%}

/* declare tokens */ 
%token NUMBER
%token ID
%token COLON
%token ASSIGN
%token SEMIC
%token INTEGER
%token BOOLEAN
%token FUNCTION
%token ERROR
%token ADD
%token SUB
%token OPENBRACE
%token CLOSEBRACE
%token MULT
%token DIV
%token MOD
%token EXCLAMATION
%token LESSTHAN
%token GREATERTHAN
%token COMMA
%token OPENPAREN
%token CLOSEPAREN
%token OPENBRACKET
%token CLOSEBRACKET
%token LESSTHANEQUAL
%token GREATERTHANEQUAL
%token EQUAL
%token NOTEQUAL
%token AND
%token OR
%token ARRAY
%token BOOLEAN
%token ELSE
%token FALSE
%token FUNCTION
%token IF
%token INTEGER
%token PRINT
%token RETURN
%token TRUE
%token VOID
%token WHILE



%start program

%%

program
: declaration-list
;

declaration-list
: declaration_list declaration
| declaration

declaration
: var-declaration
| function-declaration 

simple-type
: BOOLEAN
| INTEGER
;

array-type
: ARRAY OPENBRACKET NUMBER CLOSEBRACKET simple-type
;

literal-list
: literal
| literal-list COMMA literal
;

literal
: TRUE
| FALSE
| NUMBER
;

var-declaration
: ID COLON simple-type SEMIC
| ID COLON simple-type ASSIGN literal SEMIC
| ID COLON array-type SEMIC
| ID COLON array-type ASSIGN OPENBRACE literal-list CLOSEBRACE SEMIC
;

params
: OPENPAREN CLOSEPAREN
| OPENPAREN param-list CLOSEPAREN
;

param-list
: param
| param-list COMMA param  

param
: ID COLON simple-type /* falta parametro do tipo array */
;

function-declaration 
: ID COLON FUNCTION simple-type params ASSIGN block
| ID COLON FUNCTION VOID params ASSIGN block
;

block
: OPENBRACE var-declaration-list statement-list CLOSEBRACE
: OPENBRACE var-declaration-list CLOSEBRACE
: OPENBRACE statement-list CLOSEBRACE
: OPENBRACE CLOSEBRACE
;

var-declaration-list
: var-declaration-list var-declaration-list
;

statement-list
: /* */
| statement statement-list
;

statement
: assign-statement
| block
: selection-statement
| iteration-statement
: return-statement
| SEMIC
;

assign-statement
: var ASSIGN expression SEMIC
;

var
: ID
| ID OPENBRACKET expression CLOSEBRACKET
;

expression

selection-statement
: IF OPENPAREN expression CLOSEPAREN statement
| if OPENPAREN expression CLOSEPAREN statement ELSE statement
;

iteration-statement
: WHILE OPENPAREN expression CLOSEPAREND statement
;

return-statement
: RETURN expression SEMIC
| RETURN SEMIC
;

expression
: expression AND expression
| expression OR expression
: relational-expression
;

relational-expression
: arithmetic-expression relop arithmetic-expression
| arithmetic-expression
;

relop
: EQUAL | NOTEQUAL | LESSTHAN | LESSTHANEQUAL | GREATERTHAN | GREATERTHANEQUAL
;


%%

void yyerror(char *s, ...) { } 

