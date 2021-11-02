#ifndef ASMAPPER_C
#define ASMAPPER_C
#include <string.h>
#include "algo.c"
char var_prefix[50] = {0};

void tag(char var_name[]){
  code_append(var_prefix);
  code_append(var_name);
  code_append(":\n");
}

void tagNext(char var_name[]){
  code_append(var_prefix);
  code_append(var_name);
  code_append("_next:\n");
}

void jmp(char var_name[]){
  code_append("jmp ");
  code_append(var_prefix);
  code_append(var_name);
  code_append("\n");
}

void jmpNext(char var_name[]){
  code_append("jmp ");
  code_append(var_prefix);
  code_append(var_name);
  code_append("_next\n");
}

void db(char var_name[], char val[]){
  code_append(var_prefix);
  code_append(var_name);
  code_append(": db ");
  code_append(val);
  code_append("\n");
}

void pushad(){
  code_append("pushad\n");
}

void popad(){
  code_append("popad\n");
}

void ret(){
  code_append("ret\n");
}

void am_def_var(char var_name[], char val[]){
  jmpNext(var_name);
  db(var_name, val);
  tagNext(var_name);
}

void am_def_fun(char var_name[]){
  jmpNext(var_name);
  tag(var_name);
  pushad();
  popad();
  ret();
  tagNext(var_name);
}
#endif
