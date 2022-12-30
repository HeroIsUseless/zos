%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <fstream>
    #include "define.c"
    #include "asmmapper.c"
    #include "asmmapper.cpp"
    #include "nasmmapper.cpp"
    using namespace std;

    extern FILE* yyin;
    extern FILE* yyout;
    // 词法解析器
    extern int yylex();
    // lang转asm代码映射器
    AsmMapper* am;
    // 正在解析第几行
    extern int yylineno;
    // 错误提醒
    void yyerror(char *s){
        fprintf(stderr, "[error]line %d: %s\n", yylineno, s);
    }
    //  打开lang文件
    int open(int argc, char **argv){
        if(argc > 1){
            if(!(yyin = fopen(argv[1], "r"))){
                printf("[error] infile open failed\n");
                return 0;
            }
            if(!(yyout = fopen(argv[2], "w"))){
                printf("[error] outfile open failed\n");
                return 0;
            }
        }
        else{
            // playgound模式
            yyin = stdin;
        }
        return 1;
    }
%}
%union {
    int i;
    char* s;
    char c;
    double f;
}
%left '<' '>' '=' '#' LEQ MEQ LMO RMO
%left '+' '-'
%left '*' '/'
%token <s> INTEGER
%token <s> STRING
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
   | def_arr
   | def_fun
   ;

def_var: VAR ':' exp {am_def_var($1); am->defVarWithNumber($1);}
       | VAR ':' PATH {}
       | VAR ':' STRING {am_def_str($1, $3); am->defVarWithString($1, $3);} 
       ;

def_arr: VAR ':' '{' {am_def_arr_start($1); am->defArrayStart($1);} items '}' {am_def_arr_end($1); am->defArrayEnd($1);}
       ;

items: items ',' INTEGER {am_def_arr_item($3); am->defArrayItem($3);}
     | INTEGER {am_def_arr_item($1);}
     | /* empty */
     ;

def_fun: VAR params ':' {am_def_fun_head($1); am->defFunctionStart($1);} '(' stmts ')' {am_def_fun_end($1); am->defFunctionEnd($1);}

params: '(' ')'
      | '(' params_def ')'
      | '(' params_exec ')'
      ;

params_def: param_def
          | param_def ',' params_def
          ;

param_def: VAR ':' INTEGER {am_def_param($1); am->defParam($1);}
         ;

params_exec: param_exec
           | param_exec ',' params_exec

param_exec: exp
          ;

exec: '.' '<' '=' exp {am_return(); am->defReturn();} 
    | VAR '<' '=' exp {am_assign_var($1); am->assginVar($1);}                  /*调用函数内定义的变量*/
    | PREFIXES_VAR '<' '=' exp {am_assign_prefixesVar($1); am->assginPrefixesVar($1);} /*调用函数外定义的变量，任何文件内都可以*/
    | VAR '\\' '(' exp ')' '<' '=' exp {am_assign_arr($1); am->assginArray($1);}                  /*调用函数内定义的数组*/
    | PREFIXES_VAR '\\' '(' exp ')' '<' '=' exp {am_assign_prefixesArr($1); am->assginPrefixesArray($1);} /*调用函数外定义的数组*/
    | '&' VAR '\\' '(' exp ')' '<' '=' exp {am_assign_arl($2);}                  /*调用函数内定义的数组*/
    | '&' PREFIXES_VAR '\\' '(' exp ')' '<' '=' exp {am_assign_prefixesArl($2);} /*调用函数外定义的数组*/
    | if_head ',' stmt ')' {am_if_end(); am->defIfEnd();}
    | if_head ')' {am_if_end(); am->defIfEnd();}
    | WHILE {am_while_head();} '(' exp ',' {am_while_mid();} stmt ')' {am_while_end();}
    ;

if_head: IF {am_if_head(); am->defIfHead();} '(' exp {am_if_then(); am->defIfThen();} ',' stmt {am_if_else(); am->defIfElse();}
       ;

exp: factor 
   | exp '+' factor {am_exp_add();}
   | exp '.' '+' factor {am_exp_fadd();}
   | exp '-' factor {am_exp_sub();}
   | exp '<' factor {am_exp_les();}
   | exp '>' factor {am_exp_mor();}
   | exp LEQ factor {am_exp_leq();}
   | exp MEQ factor {am_exp_meq();}
   | exp LMO factor {am_exp_lmo();}
   | exp RMO factor {am_exp_rmo();}
   | exp '=' factor {am_exp_equ();}
   | exp '#' factor {am_exp_neq();}
   ;

factor: term 
      | factor '*' term {am_exp_mul();}
      | factor '/' term {am_exp_div();} 
      ;

term: INTEGER {am_exp_val($1); am->pushInt($1);}
    | VAR {am_exp_var($1); am->pushVar($1);}
    | PREFIXES_VAR {am_exp_prefixesVar($1);}
    | '@' VAR {am_exp_addr($2);}
    | '@' PREFIXES_VAR {am_exp_prefixesAddr($2);}
    | VAR '\\' '(' exp ')' {am_exp_arr($1);}
    | PREFIXES_VAR '\\' '(' exp ')' {am_exp_chainArr($1);}
    | '&' VAR '\\' '(' exp ')' {am_exp_addl($2);}
    | '&' PREFIXES_VAR '\\' '(' exp ')' {am_exp_prefixesAddl($2);}    
    | VAR params {am_exec_func($1); am->callFunction($1);}                        /*调用文件内定义的函数*/
    | PREFIXES_VAR params {am_exec_prefixesFunc($1); am->callPrefixesFunction($1);}       /*调用文件外定义的函数*/
    ;
%%

int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    prefixes_push(argv[2]);
    am = new NasmMapper(argv[1]);
    yylineno = 1;
    yyparse();
    // 此code是全局的
    fwrite(code, strlen(code), 1, yyout);
    fclose(yyout);
    ofstream os;
    os.open(argv[2], ios::app);
    os << ";#############新映射器效果############"<<endl;
    os << *am->getAsm() << endl;
    os.close();
    return 0;
}
