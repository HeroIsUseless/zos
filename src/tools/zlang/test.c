#include <stdio.h>
#include <stdlib.h>
#include "define.c"

void test_prefixes(){
  strcpy(prefixes[0], "./build/demo.z");
  prefixes_format();
  printf("test code:___________\n%s\n_____________________\n", prefixes[0]);
}

void test_code_cut(){
  code_append("hello\npush eax\npop eax\nworldpush eax\npop eax\n");
  printf("test code:%s\n", code);
  code_cut("push eax\npop eax\n");
  printf("test code:%s\n", code);
}

int main(){
  //test_prefixes();
  test_code_cut();
  return 0;
}
