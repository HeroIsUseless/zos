#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv){
  // int i;
  // for(i=0; i<1474560; i++){
  //   printf("%d\n", i);
  // }
  FILE *img = NULL;
  img = fopen("build/zos.img", "wb");
  char str[] = "This is runoob.com";
  fwrite(str, sizeof(str), 1, img);
  fclose(img);
  return 0;
}
