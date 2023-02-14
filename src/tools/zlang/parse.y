%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <fstream>
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
        string str = string(s);
        cout << "[zlang error]line " << yylineno << ": " << str << endl;
        assert(false);
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

def_var: VAR ':' exp {am->defVarWithNumber($1);}
       | VAR ':' PATH {}
       | VAR ':' STRING {am->defVarWithString($1, $3);} 
       ;

def_arr: VAR ':' '{' {am->defArrayStart($1);} items '}' {am->defArrayEnd($1);}
       ;

items: items ',' INTEGER {am->defArrayItem($3);}
     | INTEGER {am->defArrayItem($1);}
     | /* empty */
     ;

def_fun: VAR params ':' {am->defFunctionStart($1);} '(' stmts ')' {am->defFunctionEnd($1);}

params: '(' ')'
      | '(' params_def ')'
      | '(' params_exec ')'
      ;

params_def: param_def
          | param_def ',' params_def
          ;

param_def: VAR ':' INTEGER {am->defParam($1);}
         ;

params_exec: param_exec
           | param_exec ',' params_exec

param_exec: exp
          ;

exec: '.' '<' '=' exp {am->defReturn();} 
    | VAR '<' '=' exp {am->assginVar($1);}                  /*调用函数内定义的变量*/
    | PREFIXES_VAR '<' '=' exp {am->assginPrefixesVar($1);} /*调用函数外定义的变量，任何文件内都可以*/
    | VAR '\\' '(' exp ')' '<' '=' exp {am->assginArrayItem($1);}                  /*调用函数内定义的数组*/
    | PREFIXES_VAR '\\' '(' exp ')' '<' '=' exp {am->assginPrefixesArray($1);} /*调用函数外定义的数组*/
    | '&' VAR '\\' '(' exp ')' '<' '=' exp {am->assginArrayItem($2);}                  /*调用函数内定义的数组*/
    | '&' PREFIXES_VAR '\\' '(' exp ')' '<' '=' exp {am->assginPrefixesArray($2);} /*调用函数外定义的数组*/
    | if_head ',' stmt ')' {am->defIfEnd();}
    | if_head ')' {am->defIfEnd();}
    | WHILE {am->defWhileHead();} '(' exp ',' {am->defWhileMid();} stmt ')' {am->defWhileEnd();}
    ;

if_head: IF {am->defIfHead();} '(' exp {am->defIfThen();} ',' stmt {am->defIfElse();}
       ;

exp: factor 
   | exp '+' factor {am->add();}
   | exp '.' '+' factor {am->floatAdd();}
   | exp '-' factor {am->sub();}
   | exp '<' factor {am->les();}
   | exp '>' factor {am->mor();}
   | exp LMO factor {am->shl();}
   | exp RMO factor {am->shr();}
   | exp LEQ factor {am->leq();}
   | exp MEQ factor {am->meq();}
   | exp '=' factor {am->equ();}
   | exp '#' factor {am->neq();}
   ;
/* 相当于exp，只不过优先级比较高 */
factor: term 
      | factor '*' term {am->mul();}
      | factor '/' term {am->div();} 
      ;

term: INTEGER {am->pushInt($1);}
    | VAR {am->pushVar($1);}
    | PREFIXES_VAR {am->pushPrefixesVar($1);}
    | '@' VAR {am->pushAddress($2);}
    | '@' PREFIXES_VAR {am->pushPrefixedAddress($2);}
    | '@' VAR '\\' '(' exp ')' {am->pushArrayItemAddr($2);} /*将一个元素的地址返回TODO*/
    | '@' PREFIXES_VAR '\\' '(' exp ')' {am->pushPrefixedArrayItemAddr($2);}    
    | '^' VAR {am->pushVarByAddr($2);} /*该变量的值是另一个变量的地址，将另一个变量的值返回*/
    | '^' PREFIXES_VAR {am->pushVarByPrefixedAddr($2);}
    | '~' VAR {am->pushVarByTest($2);} /*测试运算符，表示右移4*3=12个*/
    | '~' PREFIXES_VAR {am->pushVarByPrefixedTest($2);}
    | VAR '\\' '(' exp ')' {am->pushArrayItem($1);}
    | PREFIXES_VAR '\\' '(' exp ')' {am->pushPrefixedArrayItem($1);}
    | VAR params {am->callFunction($1);}                        /*调用文件内定义的函数*/
    | PREFIXES_VAR params {am->callPrefixesFunction($1);}       /*调用文件外定义的函数*/
    ;
%%

int main(int argc, char **argv){
    if(!open(argc, argv)) return 1;
    am = new NasmMapper(argv[1]);
    yylineno = 1;
    yyparse();
    ofstream os;
    os.open(argv[2], ios::app);
    os << *am->getAsm() << endl;
    os.close();
    return 0;
}
