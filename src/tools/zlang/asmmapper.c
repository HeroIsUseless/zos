#ifndef ASMMAPPER_C
#define ASMMAPPER_C
#include <string.h>
#include "define.c"
#include "algo.c"
// tag
void tag(char var[]){
  code_appendPrefixes();
  code_append(var);
  code_append(":\n");
}

void tagNext(char var[]){
  code_appendPrefixes();
  code_append(var);
  code_append("$next:\n");
}

void tagCount(char var[], int count){
  code_appendPrefixes();
  code_append(var);
  code_append("$");
  code_appendInt(count);
  code_append(":\n");
}
// cmp
void cmpEaxWith0(){
  code_append("cmp eax, 0\n");
}
// jmp
void jump(char jmp[], char var[]){
  code_append(jmp);
  code_append(" ");
  code_appendPrefixes();
  code_append(var);
  code_append("\n");
}

void jumpCount(char jmp[], char var[], int count){
  code_append(jmp);
  code_append(" ");
  code_appendPrefixes();
  code_append(var);
  code_append("$");
  code_appendInt(count);
  code_append("\n");
}

void jmpNext(char var[]){
  code_append("jmp ");
  code_appendPrefixes();
  code_append(var);
  code_append("$next\n");
}

void jumpExp(char jmp[], char var[]){
  code_append(jmp);
  code_append(" ");
  code_appendPrefixes();
  code_append(var);
  code_append("$");
  code_appendInt(jmp_count);
  code_append("\n");
}

// data
void db(char var[], char val[]){
  code_appendPrefixes();
  code_append(var);
  code_append(": db ");
  code_append(val);
  code_append("\n");
}

void dd(char var[], char val[]){
  code_appendPrefixes();
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
void pushEbx(){
  code_append("push ebx\n");
}
void push_Eax_(){
  code_append("mov ebx, [eax]\n");
  pushEbx();
}
// register
void movVal2Eax(char val[]){
  code_append("mov eax, ");
  code_append(val);
  code_append("\n");
}

void movVal2Ebx(char val[]){
  code_append("mov ebx, ");
  code_append(val);
  code_append("\n");
}

void movVar2Eax(char var[]){
  code_append("mov eax, [");
  code_appendPrefixes();
  code_append(var);
  code_append("]\n");
}

void movEax2PrefixesVar(char var[]){
  code_append("mov [");
  code_appendPrefixes();
  code_append(var);
  code_append("], eax\n");
}

void movEax2PartPrefixesVar(char var[], int layer){
  code_append("mov [");
  code_appendPartPrefixes(layer);
  code_append(var);
  code_append("], eax\n");
}

void movPartPrefixesVar2Eax(char var[], int layer){
  code_append("mov eax, [");
  code_appendPartPrefixes(layer);
  code_append(var);
  code_append("]\n");
}

void movPartPrefixesVal2Eax(char val[], int layer){
  code_append("mov eax, ");
  code_appendPartPrefixes(layer);
  code_append(val);
  code_append("\n");
}

void movEax2Var(char var[]){
  code_append("mov [");
  code_append(var);
  code_append("], eax\n");
}

void movBl2Cl(){
  code_append("mov cl, bl\n");
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
void shlEax(){
  code_append("shl eax, cl\n");
}
void shrEax(){
  code_append("shr eax, cl\n");
}
// func
void ret(){
  code_append("ret\n");
}

void exec_func(char var[]){
  code_append("call ");
  code_append(var);
  code_append("\n");
}

void exec_prefixFunc(char var[]){
  code_append("call ");
  code_append(prefixes[0]);
  code_append("_");
  code_append(var);
  code_append("\n");
}
//////////////// out ////////////////////
void am_def_var(char var[]){
  funcVars_push(var);
  jmpNext(var);
  dd(var, "0");
  tagNext(var);
  popEax();
  movEax2PrefixesVar(var);
}

void am_def_str(char var[], char str[]){
  funcVars_push(var);
  jmpNext(var);
  dd(var, "!");
  int i;
  for(i=1; i<strlen(str)-1; i++){
    char t_s[100] = {0};
    int2str((int)str[i], t_s);
    code_append(t_s);
    code_append(", ");
  }
  code_append("0\n");
  tagNext(var);
}

void am_def_arr_start(char var[]){
  funcVars_push(var);
  jmpNext(var);
  dd(var, "!");
}

void am_def_arr_item(char val[]){
  code_append(val);
  code_append(",");
}

void am_def_arr_end(char var[]){
  code_append("\n");
  tagNext(var);
}

void am_def_param(char var[]){
  params_push(var);
}

void am_def_fun_head(char var[]){
  code_append("\n;function\n");
  jmpNext(var);
  tag(var);
  prefixes_push(var);
  funcLayer_push();
  if_counts[if_layer+1] = 0;
  while_counts[while_layer+1] = 0;
  int i;
  for(i=0; i<params_size(); i++){
    funcVars_push(params[i]);
    code_append(";param\n");
    jmpNext(params[i]);
    dd(params[i], "0");
    tagNext(params[i]);
  }
  popEbp();
  for(i=params_size()-1; i>=0; i--){
    popEax();
    movEax2PrefixesVar(params[i]);
  }
  pushEbp();
}

void am_def_fun_end(char var[]){
  params_clear();
  prefixes_pop(); 
  funcLayer_pop();

  ret();
  tagNext(var);
}

void am_return(){
  popEax();
  popEbp();
  pushEax();
  pushEbp();
  ret();
}

void am_assign_var(char var[]){
  popEax();
  int layer = funcVars_find(var);
  movEax2PartPrefixesVar(var, layer);
}

void am_assign_prefixesVar(char prefixesVar[]){
  popEax();
  movEax2Var(prefixesVar);
}

void am_assign_arr(char var[]){
  popEax(); // var
  popEbx(); // index
  code_append("mov [");
  int layer = funcVars_find(var);
  if(layer == -1){
    printf("unfind var:%s\n", var);
  }
  code_appendPartPrefixes(layer);
  code_append(var);
  code_append("+ebx], eax\n");
}

void am_assign_arl(char var[]){
  popEax(); // var
  popEbx(); // index
  code_append("mov ecx, [");
  int layer = funcVars_find(var);
  if(layer == -1){
    printf("unfind var:%s\n", var);
  }
  code_appendPartPrefixes(layer);
  code_append(var);
  code_append("]\n");
  code_append("add ecx, ebx\n");
  code_append("mov [ecx], eax\n");
}

void am_assign_prefixesArr(char prefixes_var[]){
  popEax(); // var
  popEbx(); // index
  code_append("mov [");
  code_append(prefixes_var);
  code_append("+ebx], eax\n");
}

void am_assign_prefixesArl(char prefixes_var[]){
  popEax(); // var
  popEbx(); // index
  code_append("mov ecx, [");
  code_append(prefixes_var);
  code_append("]\n");
  code_append("add ecx, ebx\n");
  code_append("mov [ecx], eax\n");
}

void am_exec_prefixesFunc(char prefixes_var[]){
  exec_func(prefixes_var);
}

void am_exec_func(char var[]){
  exec_prefixFunc(var);
}

void am_exp_val(char val[]){
  movVal2Eax(val);
  pushEax();
}

void am_exp_var(char var[]){
  int layer = funcVars_find(var);
  if(layer == -1){
    printf("unfind var:%s\n", var);
  } 
  movPartPrefixesVar2Eax(var, layer);
  pushEax();
}

void am_exp_prefixesVar(char prefixesVar[]){
  movVar2Eax(prefixesVar);
  pushEax();
}

void am_exp_addr(char addr[]){
  int layer = funcVars_find(addr);
  if(layer == -1){
    printf("unfind addr:%s\n", addr);
  } 
  movPartPrefixesVal2Eax(addr, layer);
  pushEax();
}

void am_exp_prefixesAddr(char prefixesAddr[]){
  movVal2Eax(prefixesAddr);
  pushEax();
}

void am_exp_addl(char addr[]){
  code_append("mov ebx, 4\n");
  popEax(); // 此为index
  mulEbx2Eax();
  code_append("mov ebx, eax\n");
  int layer = funcVars_find(addr);
  if(layer == -1){
    printf("unfind addr:%s\n", addr);
  } 
  movPartPrefixesVar2Eax(addr, layer);
  addEbx2Eax();
  push_Eax_();
}

void am_exp_prefixesAddl(char prefixesAddr[]){
  code_append("mov ebx, 4\n");
  popEax(); // 此为index
  mulEbx2Eax();
  code_append("mov ebx, eax\n");
  movVar2Eax(prefixesAddr);
  addEbx2Eax();
  push_Eax_();
}

void am_exp_arr(char var[]){
  popEax();
  movVal2Ebx("4");
  mulEbx2Eax();
  code_append("mov ebx, [");
  int layer = funcVars_find(var);
  if(layer == -1){
    printf("unfind var:%s\n", var);
  }
  code_appendPartPrefixes(layer);
  code_append(var);
  code_append("+eax]\n");
  pushEbx();
}

void am_exp_chainArr(char var[]){
  popEax();
  movVal2Ebx("4");
  mulEbx2Eax();
  code_append("mov ebx, [");
  code_append(var);
  code_append("+eax]\n");
  pushEbx();
}

void am_exp_add(){
  popEax();
  popEbx();
  addEbx2Eax();
  pushEax();
}

void am_exp_fadd(){
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
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("jb", "less@true");
  movVal2Eax("0");
  jumpExp("jmp", "less@false");
  tagCount("less@true", jmp_count);
  movVal2Eax("1");
  tagCount("less@false", jmp_count);
  pushEax();
}

void am_exp_mor(){
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("ja", "more@true");
  movVal2Eax("0");
  jumpExp("jmp", "more@false");
  tagCount("more@true", jmp_count);
  movVal2Eax("1");
  tagCount("more@false", jmp_count);
  pushEax();
}

void am_exp_leq(){
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("jbe", "lessequal@true");
  movVal2Eax("0");
  jumpExp("jmp", "lessequal@false");
  tagCount("lessequal@true", jmp_count);
  movVal2Eax("1");
  tagCount("lessequal@false", jmp_count);
  pushEax();
}

void am_exp_meq(){
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("jae", "moreequal@true");
  movVal2Eax("0");
  jumpExp("jmp", "moreequal@false");
  tagCount("moreequal@true", jmp_count);
  movVal2Eax("1");
  tagCount("moreequal@false", jmp_count);
  pushEax();
}

void am_exp_equ(){
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("je", "equal@true");
  movVal2Eax("0");
  jumpExp("jmp", "equal@false");
  tagCount("equal@true", jmp_count);
  movVal2Eax("1");
  tagCount("equal@false", jmp_count);
  pushEax();
}

void am_exp_neq(){
  popEbx();
  popEax();
  cmpEaxEbx();
  jmp_count++;
  jumpExp("jne", "unequal@true");
  movVal2Eax("0");
  jumpExp("jmp", "unequal@false");
  tagCount("unequal@true", jmp_count);
  movVal2Eax("1");
  tagCount("unequal@false", jmp_count);
  pushEax();
}

void am_exp_lmo(){
  popEbx();
  popEax();
  movBl2Cl();
  shlEax();
  pushEax();
}

void am_exp_rmo(){
  popEbx();
  popEax();
  movBl2Cl();
  shrEax();
  pushEax();
}

////////////////if////////////////
void am_if_head(){
  if(isIfOpens[if_layer] == TRUE)
    if_layer ++;
  if_counts[if_layer]++;
  isIfOpens[if_layer] = TRUE;
  prefixes_pushCount("if", if_counts[if_layer]);
  funcLayer_push();

  code_append("; if start\n");
  tag("start");
}

void am_if_then(){
  popEax();
  cmpEaxWith0();
  jump("je", "else");
  tag("then");
}

void am_if_else(){
  jump("jmp", "end");
  tag("else");
}

void am_if_end(){
  tag("end");
  code_append(";if end\n");

  isIfOpens[if_layer] = FALSE;
  if_counts[if_layer+1] = 0;
  if_layer --;
  prefixes_pop();
  funcLayer_pop();
}

void am_while_head(){
  code_append("; while start\n");
  if(isWhileOpens[while_layer] == TRUE)
    while_layer ++;
  while_counts[while_layer]++;
  isWhileOpens[while_layer] = TRUE;
  prefixes_pushCount("while", while_counts[while_layer]);
  funcLayer_push();

  tag("start");
}

void am_while_mid(){
  popEax();
  cmpEaxWith0();
  jump("je", "end");
}

void am_while_end(){
  jump("jmp", "start");
  tag("end");
  code_append(";while end\n");

  isWhileOpens[while_layer] = FALSE;
  while_counts[while_layer+1] = 0;
  while_layer --;
  prefixes_pop();
  funcLayer_pop();
}

#endif
