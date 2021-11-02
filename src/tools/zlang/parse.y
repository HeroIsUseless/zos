%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    void yyerror(char *s);
    extern int yylex();
    extern FILE* yyin;
    extern int yylineno;
    FILE *out_asm;
    #include "../../src/tools/zlang/asmapper.c"
%}
%union {
    int i;
    char* s;
    char c;
    double f;
}
%left '+' '-'
%left '*' '/'
%token <s> NUMBER
%token <s> INTEGER
%token ADD SUB MUL DIV ABS
%token <s> VAR
%token EOL
%type <i> exp factor term
%%
stmts: /* empty */ {}
     | stmt ';' stmts
     ;

stmt: stmt_def
    ;

stmt_def: def_var
        | def_fun
        ;

def_var: VAR ':' INTEGER {am_def_var($1, $3);}
       ;

def_fun: VAR '(' def_params ')' ':' '(' ')' {am_def_fun($1);}

def_params: /* empty */
          | def_param
          | def_param ',' def_params 
          ;

def_param: VAR ':' INTEGER {am_def_param($1);}
         ;

calclist:
        | calclist exp EOL {printf(" = %d\n", $2);}
        ;

exp: factor 
   | exp ADD factor {$$ = $1 + $3;}
   | exp SUB factor {$$ = $1 - $3;}
   ;

factor: term 
      | factor MUL term {$$ = $1 * $3;}
      | factor DIV term {$$ = $1 / $3;}
      | '(' exp ')' {$$ = $2;}
      ;

term: NUMBER 
    | ABS term {$$ = $2 >= 0? $2 : - $2;}
    ;
%%

int main(int argc, char **argv){
    if(argc > 1){
        if(!(yyin = fopen(argv[1], "r"))){
            yyin = stdin;
            printf("[error] infile open failed\n");
        }
        else {
            if(!(out_asm = fopen(argv[2], "w"))){
                printf("[error] outfile open failed\n");
                return 1;
            }
        }
    }
    yylineno = 1;
    strcpy(prefix[0], argv[1]);
    prefix_format();
    yyparse();
    printf("\ncode: \n_______________\n%s\n", code);
    fwrite(code, strlen(code), 1, out_asm);
    fclose(out_asm);
    return 0;
}

void yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
}
