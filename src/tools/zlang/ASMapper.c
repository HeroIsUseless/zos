#ifndef ASMAPPER_C
#define ASMAPPER_C
#include <string.h>
#include "algo.c"

void tag(const char* var_name, const char* code){
  strcpy(code_end(code), var_name);
  strcpy(code_end(code), ":\n");
}

void jmp(const char* var_name, const char* code){
  strcpy(code_end(code), "jmp ");
  strcpy(code_end(code), var_name);
  strcpy(code_end(code), "\n");
}

void db(const char* var_name, const char* val, const char* code){
  strcpy(code_end(code), var_name);
  strcpy(code_end(code), " db ");
  strcpy(code_end(code), val);
  strcpy(code_end(code), "\n");
}

void am_define_var(const char* var_name, const char* val, const char* code){
  tag(var_name, code);
  db(var_name, val, code);
  jmp(var_name, code);
}
#endif
