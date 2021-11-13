#ifndef ASMAPPER_C
#define ASMAPPER_C
#include <string.h>
#include "define.c"
#include "algo.c"
// tag
void tag(char var[]){
  code_appendPrefix();
  code_append(var);
  code_append(":\n");
}

void tagNext(char var[]){
  code_appendPrefix();
  code_append(var);
  code_append("$next:\n");
}
// jmp
void jmp(char var[]){
  code_append("jmp ");
  code_appendPrefix();
  code_append(var);
  code_append("\n");
}

void jmpNext(char var[]){
  code_append("jmp ");
  code_appendPrefix();
  code_append(var);
  code_append("$next\n");
}
// data
void db(char var[], char val[]){
  code_appendPrefix();
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
void pushEax(){
  code_append("push eax\n");
}
void popEbx(){
  code_append("pop ebx\n");
}
// register
void movVal2Eax(char val[]){
  code_append("mov eax, ");
  code_append(val);
  code_append("\n");
}

void movEax2Var(char var[]){
  code_append("mov [");
  code_appendPrefix();
  code_append(var);
  code_append("], eax\n");
}
// operator
void addEbx2Eax(){
  code_append("add eax, ebx\n");
}
void subEbx2Eax(){
  code_append("sub eax, ebx\n");
}
void mulEbx2Eax(){
  code_append("mul ebx\n");
}
// func
void ret(){
  code_append("ret\n");
}
void exec_func(char var[]){
  code_append("call ");
  
}
// out
void am_def_var(char var[], char val[]){
  jmpNext(var);
  db(var, val);
  tagNext(var);
}

void am_def_fun_head(char var[]){
  jmpNext(var);
  tag(var);
  popEbp();
}

void am_def_param(char var[]){
  jmpNext(var);
  db(var, "0");
  tagNext(var);
  popEax();
  movEax2Var(var);
}

void am_def_fun_tail(char var[]){
  pushEbp();
  ret();
  tagNext(var);
}

void am_assign(char var[]){
  popEax();
  movEax2Var(var);
}

void am_push(char val[]){
  movVal2Eax(val);
  pushEax();
}

void am_exp_add(){
  popEax();
  popEbx();
  addEbx2Eax();
  pushEax();
}

void am_exp_sub(){
  popEax();
  popEbx();
  subEbx2Eax();
  pushEax();
}

void am_exp_mul(){
  popEax();
  popEbx();
  mulEbx2Eax();
  pushEax();
}

void am_exec_func(char var[]){

}

#endif
