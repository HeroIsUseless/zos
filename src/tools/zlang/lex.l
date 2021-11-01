%{
  #include "parse.tab.h"
  extern YYSTYPE yylval;
%}
%option noyywrap yylineno
%%
[a-zA-Z]+ {yylval.s = strdup(yytext); printf("VAR %s\n", yylval.s); return VAR;}
[0-9]+ {yylval.s = strdup(yytext); printf("INTEGER %s\n", yylval.s); return INTEGER;}
[ \t\n] {printf("space\n");}
. {printf("char %c\n", yytext[0]); return yytext[0];}
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"*" {printf("TIMES\n");}
"/" {printf("DIVIDE\n");}
"|" {printf("ABS\n");}
\n {}
%%
