
/* EQUIPE FORMADA POR RENATA LIMA RIBEIRO DE SENA, RODRIGO CERQUEIRA SANTOS MOREIRA E JOAO VICTOR DE ARAUJO SANTANA BOMFIM */ 
/* Nome da Equipe: Renata-Joâo-Rodrigo */ 

#include <stdio.h>
#include <stdlib.h>
#include "token.h"
#include "bminus.tab.h" 

extern int yylineno; /* from lexer */
extern char *yytext;
extern int yylex();

extern int yyparse(); // Declare a função yyparse()

int main(int argc, char **argv) {
    int token;

    extern FILE *yyin; 
    FILE *fout; 

    if (argc > 2) {
        if (!(yyin = fopen(argv[1], "r"))) {
            printf("erro na abertura do arquivo de entrada %s\n", argv[1]);
            return 1;
        }
        if (!(fout = fopen(argv[2], "w"))) {
            printf("erro na criacao do arquivo de saida %s\n", argv[2]);
            return 1;
        }
    }
    else {
        printf("erro no número de argumentos de entrada\n");
        return 1;
    }

    // Chame a função yyparse() para iniciar a análise sintática
    if (yyparse() != 0) {
        printf("syntax error\n");
        return 1;
    }

    fclose(fout);
}
