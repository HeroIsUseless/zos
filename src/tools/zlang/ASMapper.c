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
// cmp
void cmpEaxWith0(){
  code_append("cmp eax, 0\n");
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

void jeElse(){
  code_append("je ");
  code_appendPrefix();
  code_append("if@else$");
  code_appendInt(if_count);
  code_append("\n");
}

void jmpEndIf(){
  code_append("jmp ");
  code_appendPrefix();
  code_append("if@end$");
  code_appendInt(if_count);
  code_append("\n");
}
void jeEndWhile(){
  code_append("je ");
  code_appendPrefix();
  code_append("while@end$");
  code_appendInt(while_count);
  code_append("\n");
}
void jmpHeadWhile(){
  code_append("jmp ");
  code_appendPrefix();
  code_append("while$");
  code_appendInt(while_count);
  code_append("\n");
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

void movVar2Eax(char var[]){
  code_append("mov eax, [");
  code_appendPrefix();
  code_append(var);
  code_append("]\n");
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
void exec_func(char prefixes_var[]){
  code_append("call ");
  code_append(prefixes_var);
  code_append("\n");
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
  prefixes_push(var);
  int i;
  for(i=0; i<params_size(); i++){
    jmpNext(params[i]);
    db(params[i], "0");
    tagNext(params[i]);
  }
  popEbp();
  for(i=0; i<params_size(); i++){
    popEax();
    movEax2Var(params[i]);
  }
  pushEbp();
}

void am_def_param(char var[]){
  params_push(var);
}

void am_def_fun_end(char var[]){
  ret();
  params_clear();
  prefixes_print();
  prefixes_pop(); 
  prefixes_print();
  tagNext(var);
}

void am_assign(char var[]){
  popEax();
  movEax2Var(var);
}

void am_pushVal(char val[]){
  movVal2Eax(val);
  pushEax();
}

void am_pushVar(char var[]){
  movVar2Eax(var);
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

void am_exec_func(char prefixes_var[]){
  exec_func(prefixes_var);
}

////////////////if////////////////
void am_if_head(){
  if_count++;
  code_appendPrefix();
  code_append("if$");
  code_appendInt(if_count);
  code_append(":\n");
  popEax();
  cmpEaxWith0();
  jeElse();
  code_appendPrefix();
  code_append("if@then$");
  code_appendInt(if_count);
  code_append(":\n");
}

void am_if_else(){
  jmpEndIf();
  code_appendPrefix();
  code_append("if@else$");
  code_appendInt(if_count);
  code_append(":\n");
}

void am_if_end(){
  code_appendPrefix();
  code_append("if@end$");
  code_appendInt(if_count);
  code_append(":\n");
}

void am_while_head(){
  while_count++;
  code_appendPrefix();
  code_append("while$");
  code_appendInt(while_count);
  code_append(":\n");
}

void am_while_mid(){
  popEax();
  cmpEaxWith0();
  jeEndWhile();
}

void am_while_end(){
  jmpHeadWhile();
  code_appendPrefix();
  code_append("while@end$");
  code_appendInt(while_count);
  code_append(":\n");
}
#endif
