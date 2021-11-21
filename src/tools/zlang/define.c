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
////////////////////vars父节点变量///////////////////
int func_layer;
char funcVars[MAX_COUNT][MAX_COUNT][MAX_NAME];
////////////////////count//////////////////////////
int jmp_count;
int if_layer;
int isIfOpens[MAX_COUNT] = {TRUE};
int if_counts[MAX_COUNT];
int while_layer;
int isWhileOpens[MAX_COUNT] = {TRUE};
int while_counts[MAX_COUNT];
void counts_add(int counts[]){
  if(counts[0] == 0){
    counts[0]++;
  }
  else{
    int i = MAX_COUNT-1;
    while(counts[i] == 0) i--;
    counts[i]++;
  }
}
void counts_push(int counts[]){
  int i=0;
  while(counts[i] != 0) i++;
  counts[i]++;
}
void counts_pop(int counts[]){
  int i = MAX_COUNT-1;
  while(counts[i] == 0) i--;
  counts[i] = 0;
}
int counts_top(int counts[]){
  int i = MAX_COUNT-1;
  while(counts[i] == 0) i--;
  return counts[i];
}
//////////////////prefix//////////////////////
char prefixes[MAX_COUNT][MAX_NAME] = {0};
int prefixes_size(){
  int i;
  for(i=MAX_COUNT; i>=0; i--){
    if(strlen(prefixes[i]) != 0){
      break;
    }
  }
  return i+1;
}

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

void prefixes_format(){
  int i;
  for(i=0; i<prefixes_size(); i++){
    prefix_format(prefixes[i]);
  }
}

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
  printf("zws:%s\n", var_count);
  prefixes_format();
}

void prefixes_pop(){
  int size = prefixes_size();
  strcpy(prefixes[size-1], "");
}

void prefixes_all(char allPrefixes[]){
  int i, size = prefixes_size();
  for(i=0; i<size; i++){
    strcpy(allPrefixes+strlen(allPrefixes), prefixes[i]);
    strcpy(allPrefixes+strlen(allPrefixes), "_");
  }
}

void prefixes_part(char partPrefixes[], int layer){
  int i;
  for(i=0; i<layer; i++){
    strcpy(partPrefixes+strlen(partPrefixes), prefixes[i]);
    strcpy(partPrefixes+strlen(partPrefixes), "_");
  }
}

void prefixes_print(){
  int i;
  for(i=0; i<prefixes_size(); i++){
    printf("%s\n", prefixes[i]);
  }
}

//////////////////params//////////////////////
char params[MAX_COUNT][MAX_NAME] = {0};
int params_size(){
  int i;
  for(i=MAX_COUNT; i>=0; i--){
    if(strlen(params[i]) != 0){
      break;
    }
  }
  return i+1;
}

void params_push(char var[]){
  int size = params_size();
  strcpy(params[size], var);
}

void params_pop(){
  int size = params_size();
  strcpy(params[size-1], "");
}

void params_clear(){
  int i;
  for(i=0; i<params_size(); i++){
    strcpy(params[i], "");
  }
}
///////////////////code////////////////////////////
char code[MAX_COLEN] = {0};
void code_append(char code_part[]){
  char code_part_format[MAX_COLEN] = {0};
  strcpy(code_part_format, code_part);
  int i = 0;
  for(i=0; i<strlen(code_part_format); i++){
    if(code_part_format[i] == '.' || code_part_format[i] == '\\'){
      code_part_format[i] = '_';
    }
  }
  strcpy(code+strlen(code), code_part_format);
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
