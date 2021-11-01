#ifndef ALGO_C
#define ALGO_C

void code_append(char code_part[], char code[]){
  char* code_end = code + strlen(code);
  int i;
  for(i=0; i<strlen(code_part); i++){
    code_end[i] = code_part[i];
  }
}

#endif
