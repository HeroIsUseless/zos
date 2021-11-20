%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    extern FILE* yyin;
    FILE *out_asm;
    void yyerror(char *s);
    extern int yylex();
    extern int yylineno;
    #include "define.c"
    #include "asmapper.c"
%}
%union {
    int i;
    char* s;
    char c;
    double f;
}
%left '<' '>' '=' '#' LEQ MEQ
%left '+' '-'
%left '*' '/'
%token <s> NUMBER
%token <s> INTEGER
%token <s> VAR PATH PREFIXES_VAR
%token IF WHILE
%token EOL
%%
stmts: /* empty */ {}
     | stmt ';' stmts {/*printf("[line]%d:\n", yylineno);*/}
     ;

stmt: def 
    | exec
    | exp
    | '(' stmts ')'
    ;

def: def_var
   | def_fun
   ;

def_var: VAR ':' exp {am_def_var($1);}
       | VAR ':' PATH {}
       ;

def_fun: VAR params ':' {am_def_fun_head($1);} '(' stmts ')' {am_def_fun_end($1);}

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

exec: VAR '<' '=' exp {am_assign_var($1);}                  /*调用函数内定义的变量*/
    | PREFIXES_VAR '<' '=' exp {am_assign_prefixesVar($1);} /*调用函数外定义的变量，任何文件内都可以*/
    | VAR params {am_exec_func($1);}                        /*调用文件内定义的函数*/
    | PREFIXES_VAR params {am_exec_prefixesFunc($1);}       /*调用文件外定义的函数*/
    | if_head ',' stmt ')' {am_if_end();}
    | if_head ')' {am_if_end();}
    | WHILE {am_while_head();} '(' exp ',' {am_while_mid();} stmt ')' {am_while_end();}
    ;

if_head: IF {am_if_head();} '(' exp {am_if_then();} ',' stmt {am_if_else();}
       ;

exp: factor 
   | exp '+' factor {am_exp_add();}
   | exp '-' factor {am_exp_sub();}
   | exp '<' factor {am_exp_les();}
   | exp '>' factor {am_exp_mor();}
   | exp LEQ factor {am_exp_leq();}
   | exp MEQ factor {am_exp_meq();}
   | exp '=' factor {am_exp_equ();}
   | exp '#' factor {am_exp_neq();}
   ;

factor: term 
      | factor '*' term {am_exp_mul();}
      | factor '/' term {am_exp_div();} 
      ;

term: INTEGER {am_pushVal($1);}
    | VAR {am_pushVar($1);}
    ;
%%
int open(int argc, char **argv);
int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    prefixes_push(argv[1]);
    yylineno = 1;
    yyparse();
    //printf("[code]:\n%s\n", code);
    code_cut("push eax\npop eax\n");
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
