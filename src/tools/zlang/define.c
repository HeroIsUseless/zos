#ifndef DEFINE_C
#define DEFINE_C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME 50
#define MAX_COUNT 100
#define MAX_COLEN 524288

//////////////////prefix//////////////////////
char prefix[MAX_COUNT][MAX_NAME] = {0};
int prefix_size(){
  int i;
  for(i=MAX_COUNT; i>=0; i--){
    if(strlen(prefix[i]) != 0){
      break;
    }
  }
  return i+1;
}

void prefix_format(){
  int i;
  for(i=0; i<prefix_size(); i++){
    int end = strlen(prefix[i]);
    int begin = end;
    while(begin>-1 && prefix[i][begin]!='/'){
      begin --;
    }
    begin++;
    int j;
    for(j=0; j<end-begin; j++){
      prefix[i][j] = prefix[i][j+begin];
    }
    prefix[i][j] = 0;
  }
}

void prefix_all(char allPrefix[]){
  int i, size = prefix_size();
  for(i=0; i<size; i++){
    strcpy(allPrefix+strlen(allPrefix), prefix[i]);
    strcpy(allPrefix+strlen(allPrefix), "@");
  }
}

void prefix_push(char var[]){
  int size = prefix_size();
  strcpy(prefix[size], var);
}

void prefix_pop(){
  int size = prefix_size();
  strcpy(prefix[size-1], "");
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
  char allPrefix[MAX_COUNT*MAX_NAME] = {0};
  prefix_all(allPrefix);
  code_append(allPrefix);
}

#endif
