#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv){
  char code[524288] = {0};
  int i;
  for(i=1; i<argc-1; i++){
    //printf("file %s\n", argv[i]);
    FILE* inFile = fopen(argv[i], "r");
    if(!inFile){
      printf("[error] open asm infile failed %s\n", argv[i]);
      return 1;
    }
    fread(code+strlen(code), 524288-strlen(code), 1, inFile);
    fclose(inFile);
  }
  FILE* outFile = fopen(argv[i], "w");
  if(!outFile){
    printf("[error] open asm outfile failed\n");
    return 1;
  }
  fwrite(code, strlen(code), 1, outFile);
  fclose(outFile);
  int line = 0;
  for(i=0; i<strlen(code); i++){
    if(code[i] == '\n') line ++;
  }
  printf("[zlink] code line:%d\n", line);
  return 0;
}

