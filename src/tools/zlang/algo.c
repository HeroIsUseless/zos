#ifndef ALGO_C
#define ALGO_C
#include "define.c"
#include <string.h>
void int2str(int num, char num_str[]){
  while(num){
    int mod = num%10;
    num_str[strlen(num_str)] = mod + '0';
    num /= 10;
  }
}
#endif
