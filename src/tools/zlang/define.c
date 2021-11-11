#ifndef DEFINE_C
#define DEFINE_C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME 50
#define MAX_COUNT 100
#define MAX_COLEN 524288
char prefix[MAX_COUNT][MAX_NAME] = {0};
char code[524288] = {0};
void code_append(char code_part[]){
  char* code_end = code + strlen(code);
  int i;
  for(i=0; i<strlen(code_part); i++){
    code_end[i] = code_part[i];
  }
}

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

}

#endif
