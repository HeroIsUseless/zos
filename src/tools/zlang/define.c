#ifndef DEFINE_C
#define DEFINE_C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "algo.c"

#define MAX_NAME 50
#define MAX_COUNT 100
#define MAX_COLEN 524288
#define TRUE 1
#define FALSE 0
////////////////////count//////////////////////////
/////////////用于区分不同的if和while//////////////////
int jmp_count;

int if_layer;
int isIfOpens[MAX_COUNT] = {TRUE};
int if_counts[MAX_COUNT];

int while_layer;
int isWhileOpens[MAX_COUNT] = {TRUE};
int while_counts[MAX_COUNT];
// 表示counts有多少层
int count_layer(int counts[]){
  if(counts[0] == 0){
    return 1;
  }
  else{
    int i = 0;
    while(counts[i] != 0) i++;
    return i;
  }
}
// 用于同层的下一个if或while
// 理论上是找最后一个不为0的，+1
void counts_add(int counts[]){
  counts[count_layer(counts)-1]++;
}
// 用于下一层的if或while
void counts_push(int counts[]){
  counts[count_layer(counts)] = 1;
}

void counts_pop(int counts[]){
  counts[count_layer(counts)-1] = 0;
}
int counts_top(int counts[]){
  return counts[count_layer(counts)-1];
}
//////////////////prefix//////////////////////
char prefixes[MAX_COUNT][MAX_NAME] = {0};

int prefixes_size(){
  int i=0;
  while(strlen(prefixes[i]) != 0){
    i++;
  } 
  return i;
}
// 仅仅用于删除路径前面的东西
void prefix_format(char prefix[]){
  int end = strlen(prefix);
  int begin = end;
  while(begin>-1 && prefix[begin]!='/'){
    begin --;
  }
  begin++;
  int i;
  for(i=0; i<end-begin; i++){
    prefix[i] = prefix[i+begin];
  }
  prefix[i] = 0;
}
// 仅仅用于删除路径前面的东西
void prefixes_format(){
  int i;
  for(i=0; i<prefixes_size(); i++){
    prefix_format(prefixes[i]);
  }
}
// 压入前缀
void prefixes_push(char var[]){
  int size = prefixes_size();
  strcpy(prefixes[size], var);
  prefixes_format();
}

void prefixes_pushCount(char var[], int count){
  char var_count[MAX_COUNT] = {0};
  char count_str[MAX_COUNT] = {0};
  int2str(count, count_str);
  strcpy(var_count+strlen(var_count), var);
  strcpy(var_count+strlen(var_count), "$");
  strcpy(var_count+strlen(var_count), count_str);
  int size = prefixes_size();
  strcpy(prefixes[size], var_count);
  prefixes_format();
}

void prefixes_pop(){
  strcpy(prefixes[prefixes_size()-1], "");
}

void prefixes_all(char allPrefixes[]){
  int i, size = prefixes_size();
  for(i=0; i<size; i++){
    strcpy(allPrefixes+strlen(allPrefixes), prefixes[i]);
    strcpy(allPrefixes+strlen(allPrefixes), "_");
  }
}

void prefixes_part(char partPrefixes[], int layer){
  if(layer == -1){
    strcpy(partPrefixes, " !!! var is not defined !!! ");
  }
  else{
    int i;
    for(i=0; i<=layer; i++){
      strcpy(partPrefixes+strlen(partPrefixes), prefixes[i]);
      strcpy(partPrefixes+strlen(partPrefixes), "_");
    }
  }
}

void prefixes_print(){
  int i;
  for(i=0; i<prefixes_size(); i++){
    printf("[prefixes_print]%s\n", prefixes[i]);
  }
}

//////////////////params//////////////////////
char params[MAX_COUNT][MAX_NAME] = {0};

int params_size(){
  int i = 0;
  while(strlen(params[i]) != 0) i++;
  return i;
}

void params_push(char var[]){
  strcpy(params[params_size()], var);
}

void params_pop(){
  strcpy(params[params_size()-1], "");
}

void params_clear(){
  int i;
  for(i=0; i<params_size(); i++){
    strcpy(params[i], "");
  }
}
////////////////////vars父节点变量///////////////////
int funcLayer;
char funcVars[MAX_COUNT][MAX_COUNT][MAX_NAME];

int funcLayer_varsCount(int layer){
  int i = 0;
  while(strlen(funcVars[layer][i]) != 0) i++;
  return i;
}

void funcVars_push(char var[]){
  int n = funcLayer_varsCount(funcLayer);
  strcpy(funcVars[funcLayer][n], var);
}

void funcVars_clear(){
  int i, n = funcLayer_varsCount(funcLayer);
  for(i=0; i<n; i++){
    strcpy(funcVars[funcLayer][i], "");
  }
}

void funcLayer_push(){
  funcLayer++;
}

void funcLayer_pop(){
  funcVars_clear();
  funcLayer--;
}

int funcVars_find(char var[]){
  int i;
  printf("search var: funclayer:%d\n", funcLayer);
  for(i=0; i<=funcLayer; i++){
    int j, n = funcLayer_varsCount(funcLayer);
    for(j=0; j<n; j++){
      printf("cmp var:[%d][%d]:%s|%s\n", i, j, var, funcVars[i][j]);
      if(strcmp(funcVars[i][j], var) == 0)
        return i;
    }
  }
  return -1;
}
///////////////////code////////////////////////////
char code[MAX_COLEN] = {0};

void code_format(char code_format[]){
  int i = 0;
  for(i=0; i<strlen(code_format); i++){
    if(code_format[i] == '.' || code_format[i] == '\\'){
      code_format[i] = '_';
    }
  }
}

void code_append(char code_part[]){
  code_format(code_part);
  strcpy(code+strlen(code), code_part);
}

void code_appendPrefixes(){
  char allPrefixes[MAX_COUNT*MAX_NAME] = {0};
  prefixes_all(allPrefixes);
  code_append(allPrefixes);
}

void code_appendPartPrefixes(int layer){
  char partPrefixes[MAX_COUNT*MAX_NAME] = {0};
  prefixes_part(partPrefixes, layer);
  code_append(partPrefixes);
}

void code_appendInt(int num){
  char num_str[100] = {0};
  int2str(num, num_str);
  code_append(num_str);
}
// 整理汇编代码，删除类似 push eax pop eax之类的
void code_cut(char code_part[]){
  int begin = KMP(code, code_part);
  while(begin > -1){
    int code_len = strlen(code);
    int code_part_len = strlen(code_part);
    int i;
    for(i=begin; i<code_len-code_part_len; i++){
      code[i] = code[i+code_part_len];
    }
    code[i] = 0;
    begin = KMP(code, code_part);
  }
}
#endif
