%{
  #include "parse.tab.h"
  int chars = 0;
  int words = 0;
  int lines = 0;
  extern YYSTYPE yylval;
%}
%option noyywrap yylineno
%%
[a-zA-Z]+ {words++; chars+=strlen(yytext); printf("VAR %s\n", yytext); return VAR;}
[0-9]+ {yylval.i=12344; printf("INTEGER %s\n", yytext); return INTEGER;}
[ \t\n] {printf("space\n");}
. {printf("char %c\n", yytext[0]); return yytext[0];}
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"*" {printf("TIMES\n");}
"/" {printf("DIVIDE\n");}
"|" {printf("ABS\n");}
\n {chars++; lines++;}
%%
