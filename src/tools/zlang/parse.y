%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    extern FILE* yyin;
    FILE *out_asm;
    void yyerror(char *s);
    extern int yylex();
    extern int yylineno;
    #include "asmapper.c"
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

stmt: def 
    | exec
    | exp
    | '(' stmts ')'
    ;

def: def_var
   | def_fun
   ;

def_var: VAR ':' INTEGER {am_def_var($1, $3);}
       ;

def_fun: VAR params ':' {am_def_fun_head($1);} '(' ')' {am_def_fun_tail($1);}

params: '(' ')'
      | '(' params_def ')'
      | '(' params_exec ')'
      ;

params_def: param_def
          | param_def ',' params_def
          ;

param_def: VAR ':' INTEGER {am_def_param($1);}
         ;

params_exec: param_exec
           | param_exec ',' params_exec

param_exec: exp
          ;

exec: VAR '<' '=' exp {am_assign($1);}
    | VAR params {am_exec_func($1);}
    ;

exp: factor 
   | exp '+' factor {am_exp_add();}
   | exp '-' factor {am_exp_sub();}
   ;

factor: term 
      | factor '*' term {am_exp_mul();}
      | factor '/' term 
      ;

term: INTEGER {am_push($1);}
    ;
%%
int open(int argc, char **argv);
int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    prefixes_push(argv[1]);
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
