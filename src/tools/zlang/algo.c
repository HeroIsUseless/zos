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
  int i;
  for(i=0; i<strlen(num_str)/2; i++){
     char t_c = num_str[i];
     num_str[i] = num_str[strlen(num_str)-1-i];
     num_str[strlen(num_str)-1-i] = t_c;
  }
}

void Getnext(int next[], char t[])
{
   int j=0,k=-1;
   next[0]=-1;
   while(j<strlen(t)-1)
   {
      if(k == -1 || t[j] == t[k])
      {
         j++;k++;
         if(t[j]==t[k])
            next[j] = next[k];
         else
            next[j] = k;
      }
      else k = next[k];
   }
}

int KMP(char s[],char t[]){
   int next[100]={0},i=0,j=0;
   Getnext(next, t);
   i=0;
   while(i<(int)strlen(s)&&j<(int)strlen(t)){
      if(s[i]==t[j] || j==-1){
         i++;
         j++;
      }
      else j=next[j];               //j回退
   }
   if(j>=(int)strlen(t)){
     return (i-strlen(t));         //匹配成功，返回子串的位置
   }
   else
      return (-1);                  //没找到
}
#endif
