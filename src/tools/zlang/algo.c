#ifndef ALGO_C
#define ALGO_C

const char* code_end(char code[]){
  return code+strlen(code);
}

void code_push(char code[], char code_part[]){
  int end = code+strlen(code);
  int i;
  for(i=0; i<strlen(code_part); i++){
    code[end+i] = code_part[i];
  }
}

#endif
