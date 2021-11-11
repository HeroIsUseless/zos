#ifndef DEFINE_C
#define DEFINE_C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME 50
#define MAX_COUNT 100
#define MAX_COLEN 524288
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
    end = strlen(prefix[i]);
    for(j=0; j<end; j++){
      if(prefix[i][j] == '.'){
        prefix[i][j] = '_';
      }
    }
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

char code[MAX_COLEN] = {0};
void code_append(char code_part[]){
  strcpy(code+strlen(code), code_part);
}

void code_appendPrefix(){
  char allPrefix[MAX_COUNT*MAX_NAME] = {0};
  prefix_all(allPrefix);
  code_append(allPrefix);
}

#endif
