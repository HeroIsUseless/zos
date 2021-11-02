#ifndef ASMAPPER_C
#define ASMAPPER_C
#include <string.h>
# include "define.c"
#include "algo.c"
// tag
void tag(char var[]){
  code_append(prefix);
  code_append(var);
  code_append(":\n");
}

void tagNext(char var[]){
  code_append(prefix);
  code_append(var);
  code_append("_next:\n");
}
// jmp
void jmp(char var[]){
  code_append("jmp ");
  code_append(prefix);
  code_append(var);
  code_append("\n");
}

void jmpNext(char var[]){
  code_append("jmp ");
  code_append(prefix);
  code_append(var);
  code_append("_next\n");
}
// data
void db(char var[], char val[]){
  code_append(prefix);
  code_append(var);
  code_append(": db ");
  code_append(val);
  code_append("\n");
}
// push pop
void pushad(){
  code_append("pushad\n");
}

void popad(){
  code_append("popad\n");
}

void popEbp(){
  code_append("pop ebp\n");
}

void pushEbp(){
  code_append("push ebp\n");
}
void popEax(){
  code_append("pop eax\n");
}
// register
void movVal2Eax(char val[]){
  code_append("mov eax, ");
  code_append(val);
  code_append("\n");
}

void movEax2Var(char var[]){
  code_append("mov [");
  code_append(var);
  code_append("], eax\n");
}
// func
void ret(){
  code_append("ret\n");
}
// out
void am_def_var(char var[], char val[]){
  jmpNext(var);
  db(var, val);
  tagNext(var);
}

void am_def_fun(char var[]){
  jmpNext(var);
  tag(var);
  popEbp();
  pushEbp();
  ret();
  tagNext(var);
}

void am_def_param(char var[]){
  jmpNext(var);
  db(var, "0");
  tagNext(var);
  popEax();
  movEax2Var(var);
}

#endif
