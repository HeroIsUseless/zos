%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    extern FILE* yyin;
    FILE *out_asm;
    void yyerror(char *s);
    extern int yylex();
    extern int yylineno;
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
%%
stmts: /* empty */ {}
     | stmt ';' stmts {printf("[line]%d:\n", yylineno);}
     ;

stmt: stmt_def 
    | stmt_exec
    ;

stmt_def: def_var
        | def_fun
        ;

def_var: VAR ':' INTEGER {am_def_var($1, $3);}
       ;

def_fun: VAR {am_def_fun_head($1); prefix_push($1);} '(' def_params ')' ':' '(' ')' {prefix_pop(); am_def_fun_tail($1);}

def_params: /* empty */
          | def_param
          | def_param ',' def_params 
          ;

def_param: VAR ':' INTEGER {am_def_param($1);}
         ;

stmt_exec: VAR '<' '=' exp {am_assign($1);}
         ;

exp: factor 
   | exp '+' factor
   | exp '-' factor
   ;

factor: term 
      | factor '*' term
      | factor '/' term 
      | '(' exp ')'
      ;

term: INTEGER 
    | '-' term
    ;
%%
int open(int argc, char **argv);
int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    strcpy(prefix[0], argv[1]);
    prefix_format();
    yylineno = 1;
    yyparse();
    printf("[success]code:\n%s\n", code);
    fwrite(code, strlen(code), 1, out_asm);
    fclose(out_asm);
    return 0;
}

void yyerror(char *s){
    fprintf(stderr, "[error]line %d: %s\n", yylineno, s);
}

int open(int argc, char **argv){
    if(argc > 1){
        if(!(yyin = fopen(argv[1], "r"))){
            printf("[error] infile open failed\n");
            return 0;
        }
        else {
            if(!(out_asm = fopen(argv[2], "w"))){
                printf("[error] outfile open failed\n");
                return 0;
            }
        }
    }
    else{
        yyin = stdin;
    }
    return 1;
}
