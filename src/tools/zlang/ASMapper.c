#ifndef ASMAPPER_C
#define ASMAPPER_C
#include <string.h>
#include "algo.c"
char var_prefix[50] = {0};

void tag(char var_name[], char code[]){
  code_append(var_prefix, code);
  code_append(var_name, code);
  code_append(":\n", code);
}

void tagNext(char var_name[], char code[]){
  code_append(var_prefix, code);
  code_append(var_name, code);
  code_append("_next:\n", code);
}

void jmp(char var_name[], char code[]){
  code_append("jmp ", code);
  code_append(var_prefix, code);
  code_append(var_name, code);
  code_append("\n", code);
}

void jmpNext(char var_name[], char code[]){
  code_append("jmp ", code);
  code_append(var_prefix, code);
  code_append(var_name, code);
  code_append("_next\n", code);
}

void db(char var_name[], char val[], char code[]){
  code_append(var_prefix, code);
  code_append(var_name, code);
  code_append(": db ", code);
  code_append(val, code);
  code_append("\n", code);
}

void am_define_var(char var_name[], char val[], char code[]){
  jmpNext(var_name, code);
  db(var_name, val, code);
  tagNext(var_name, code);
}
#endif
