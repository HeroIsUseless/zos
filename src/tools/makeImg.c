#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv){
  FILE *IPL_bin = NULL;
  FILE *ZOS_img = NULL;
  char IPL_buf[512] = {0};
  char ZOS_buf[1474560] = {0};
  IPL_bin = fopen("build/IPL.bin", "r");
  ZOS_img = fopen("build/ZOS.img", "w");
  fread(IPL_buf, sizeof(IPL_buf), 1, IPL_bin);
  memcpy(ZOS_buf, IPL_buf, 512);
  fwrite(ZOS_buf, sizeof(ZOS_buf), 1, ZOS_img);
  fclose(IPL_bin);
  fclose(ZOS_img);
  return 0;
}
