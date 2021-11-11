#include <stdio.h>
#include <stdlib.h>
#include "define.c"

void test_prefix(){
  strcpy(prefix[0], "./build/demo.z");
  prefix_format();
  printf("test code:___________\n%s\n_____________________\n", prefix[0]);
}

int main(){
  test_prefix();
  return 0;
}
