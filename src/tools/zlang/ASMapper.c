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

void tagCount(char var[], int count){
  code_appendPrefix();
  code_append(var);
  code_appendInt(count);
  code_append(":\n");
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

void jmpExp(char jmp[], char var[]){
  code_append(jmp);
  code_append(" ");
  code_appendPrefix();
  code_append(var);
  code_appendInt(jmp_count);
  code_append("\n");
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
void dd(char var[], char val[]){
  code_appendPrefix();
  code_append(var);
  code_append(": dd ");
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
void divEbx2Eax(){
  code_append("div ebx\n");
}
void cmpEaxEbx(){
  code_append("cmp eax, ebx\n");
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
void am_def_var(char var[]){
  jmpNext(var);
  dd(var, "0");
  tagNext(var);
  popEax();
  movEax2Var(var);
}

void am_def_fun_head(char var[]){
  jmpNext(var);
  tag(var);
  prefixes_push(var);
  int i;
  for(i=0; i<params_size(); i++){
    jmpNext(params[i]);
    dd(params[i], "0");
    tagNext(params[i]);
  }
  popEbp();
  for(i=params_size()-1; i>=0; i--){
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
  prefixes_pop(); 
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

void am_exp_div(){
  popEax();
  popEbx();
  divEbx2Eax();
  pushEax();
}
void am_exp_les(){
  popEax();
  popEbx();
  cmpEaxEbx();
  jmp_count++;
  jmpExp("jb", "less@true$");
  movVal2Eax("0");
  jmpExp("jmp", "less@false$");
  tagCount("less@true$", jmp_count);
  movVal2Eax("1");
  tagCount("less@false$", jmp_count);
  pushEax();
}

void am_exp_mor(){
  popEax();
  popEbx();
  cmpEaxEbx();
  jmp_count++;
  jmpExp("ja", "more@true$");
  movVal2Eax("0");
  jmpExp("jmp", "more@false$");
  tagCount("more@true$", jmp_count);
  movVal2Eax("1");
  tagCount("more@false$", jmp_count);
  pushEax();
}

void am_exp_equ(){
  popEax();
  popEbx();
  cmpEaxEbx();
  jmp_count++;
  jmpExp("je", "equal@true$");
  movVal2Eax("0");
  jmpExp("jmp", "equal@false$");
  tagCount("equal@true$", jmp_count);
  movVal2Eax("1");
  tagCount("equal@false$", jmp_count);
  pushEax();
}

void am_exp_neq(){
  popEax();
  popEbx();
  cmpEaxEbx();
  jmp_count++;
  jmpExp("jne", "unequal@true$");
  movVal2Eax("0");
  jmpExp("jmp", "unequal@false$");
  tagCount("unequal@true$", jmp_count);
  movVal2Eax("1");
  tagCount("unequal@false$", jmp_count);
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
