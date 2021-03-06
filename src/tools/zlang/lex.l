%{
  #include "parse.tab.h"
  extern YYSTYPE yylval;
%}
%option noyywrap yylineno
%%
    /* 注释 */
\[[^\[]*\] {
    //printf("annotations: %s\n", yytext);
}
\[[^\[\n]*\n {
    //printf("annotation: %s\n", yytext);
}
\\< {
    return LEQ;
}
>\/ {
    return MEQ;
}
if {
    return IF;
}
while {
    return WHILE;
}
dword {
    return INTEGER;
}
\".*\" {
    yylval.s = strdup(yytext); 
    return STRING;
}
@\\[\\a-zA-Z0-9\.]+ {
    yylval.s = strdup(yytext); 
    printf("path:%s\n", yylval.s);
    return PATH;
}
[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z0-9]+)?(\\[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z0-9]+)?)+ {
    yylval.s = strdup(yytext); 
    //printf("PREFIXES_VAR %s\n", yylval.s); 
    return PREFIXES_VAR; // 不会有一半的，全部都是从文件开始的
}
[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z0-9]+)? {
    yylval.s = strdup(yytext); 
    //printf("VAR %s\n", yylval.s); 
    return VAR;
}        
0x[0-9a-f]+ {
    yylval.s = strdup(yytext); 
    //printf("INTEGER %s\n", yylval.s); 
    return INTEGER;
}
[0-9]+ {
    yylval.s = strdup(yytext); 
    //printf("INTEGER %s\n", yylval.s); 
    return INTEGER;
}
[ \t\n] {}
. {
    //printf("char %c\n", yytext[0]); 
    return yytext[0];
}
%%
