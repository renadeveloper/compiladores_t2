/* EQUIPE FORMADA POR RENATA LIMA RIBEIRO DE SENA, RODRIGO CERQUEIRA SANTOS MOREIRA E JOAO VICTOR DE ARAUJO SANTANA BOMFIM */ 
/* Nome da Equipe: Renata-Joâo-Rodrigo */ 



%option noyywrap yylineno nodefault
%{

// yylineno    - variable to track line numbers 

#include "bminus.tab.h"

%}

DIGIT   [0-9]
LETTER  [A-Za-z] 
ID      [a-zA-Z][a-zA-Z0-9_]*

%%

"array"    { return ARRAY; }
"boolean"  { return BOOLEAN; }
"else"     { return ELSE; }
"false"    { return FALSE; }
"function" { return FUNCTION; }
"if"       { return IF; }
"integer"  { return INTEGER; }
"print"    { return PRINT; }
"return"   { return RETURN; }
"true"     { return TRUE; }
"void"     { return VOID; }
"while"    { return WHILE; }


[0-9]+   { return NUM; }


"+"	       { return ADD; }
"-"	       { return SUB; }
"*"	       { return MULT; }
"/"	       { return DIV; }
"%"	       { return MOD; }
"!"	       { return EXCLAMATION; }
"<"	       { return LESSTHAN; }
">"	       { return GREATERTHAN; }
"="	       { return ASSIGN; }
":"	       { return COLON; }
";"	       { return SEMIC; }
","	       { return COMMA; }
"("	       { return OPENPAREN; }
")"	       { return CLOSEPAREN; }
"["	       { return OPENBRACKET; }
"]"	       { return CLOSEBRACKET; }
"{"	       { return OPENBRACE; }
"}"	       { return CLOSEBRACE; }


"<="       { return LESSTHANEQUAL; }
">="       { return GREATERTHANEQUAL; }
"=="       { return EQUAL; }
"!="       { return NOTEQUAL; }
"&&"       { return AND; }
"||"       { return OR; }

[ ]+        { /* ignore whitespace */ }
[\t]+       { /* ignore tab */ }
[\r]+       { /* ignore carriage return */ }
[\n]+       { /* ignore newline */ }
"//"(.)* { /* ignore single-line comments */ }

{ID}+     { return ID; }

.	       { return ERROR; }

%%
