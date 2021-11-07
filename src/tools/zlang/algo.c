#ifndef ALGO_C
#define ALGO_C
#include "define.c"
void code_append(char code_part[]){
  char* code_end = code + strlen(code);
  int i;
  for(i=0; i<strlen(code_part); i++){
    code_end[i] = code_part[i];
  }
}

void prefix_format(char prefix[]){
  int begin = strlen(prefix);
  int end = begin;
  while(begin>-1 && prefix[begin]!='/'){
    begin --;
  }
  begin++;
  int i;
  for(i=0; i<end-begin; i++){
    prefix[i] = prefix[i+begin];
  }
  prefix[i] = 0;
  end = strlen(prefix);
  for(i=0; i<end; i++){
    if(prefix[i] == '.'){
      prefix[i] = '_';
    }
  }
  prefix[i] = '_';
  prefix[++i] = 0;
}

void prefix_all(char allPrefix[]){

}

#endif
