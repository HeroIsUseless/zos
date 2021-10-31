#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int os_size(char main_buf[]){
  int i;
  for(i = 524287; i>=0; i--){
    if(main_buf[i] != 0) break;
  }
  return i+1;
}

int main(int argc, char** argv){

  FILE *IPL_bin = NULL;
  FILE *boot_bin = NULL;
  FILE *main_bin = NULL;
  FILE *ZOS_img = NULL;

  char IPL_buf[512] = {0};
  char boot_buf[512] = {0};
  char main_buf[524288] = {0};
  char ZOS_buf[1474560] = {0};

  IPL_bin = fopen("build/IPL.bin", "r");
  boot_bin = fopen("build/boot.bin", "r");
  main_bin = fopen("build/main.bin", "r");
  ZOS_img = fopen("build/ZOS.img", "w");

  fread(IPL_buf, sizeof(IPL_buf), 1, IPL_bin);
  fread(boot_buf, sizeof(boot_buf), 1, boot_bin);
  fread(main_buf, sizeof(main_buf), 1, main_bin);
  printf("[info] os size: %d/524288\n", os_size(main_buf));

  memcpy(ZOS_buf, IPL_buf, 512);
  memcpy(ZOS_buf+512, boot_buf, 512);
  memcpy(ZOS_buf+1024, main_buf, 524288);

  fwrite(ZOS_buf, sizeof(ZOS_buf), 1, ZOS_img);

  fclose(IPL_bin);
  fclose(boot_bin);
  fclose(main_bin);
  fclose(ZOS_img);
  
  return 0;
}
