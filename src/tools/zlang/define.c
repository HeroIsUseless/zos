#ifndef DEFINE_C
#define DEFINE_C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "algo.c"

#define MAX_NAME 50
#define MAX_COUNT 100
#define MAX_COLEN 524288
//////////////////////////////////////////////
int if_count;
int while_count;
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

void prefixes_all(char allPrefixes[]){
  int i, size = prefixes_size();
  for(i=0; i<size; i++){
    strcpy(allPrefixes+strlen(allPrefixes), prefixes[i]);
    strcpy(allPrefixes+strlen(allPrefixes), "@");
  }
}

void prefixes_push(char var[]){
  int size = prefixes_size();
  strcpy(prefixes[size], var);
  prefixes_format();
}

void prefixes_pop(){
  int size = prefixes_size();
  strcpy(prefixes[size-1], "");
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
  for(i=0; i<prefixes_size(); i++){
    strcpy(prefixes[i], "");
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

void code_appendPrefix(){
  char allPrefixes[MAX_COUNT*MAX_NAME] = {0};
  prefixes_all(allPrefixes);
  code_append(allPrefixes);
}

void code_appendInt(int num){
  char num_str[100] = {0};
  int2str(num, num_str);
  code_append(num_str);
}
#endif
