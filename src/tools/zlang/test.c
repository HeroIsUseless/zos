#include <stdio.h>
#include <stdlib.h>
#include "define.c"

void test_prefixes(){
  strcpy(prefixes[0], "./build/demo.z");
  prefixes_format();
  printf("test code:___________\n%s\n_____________________\n", prefixes[0]);
}

int main(){
  test_prefixes();
  return 0;
}
