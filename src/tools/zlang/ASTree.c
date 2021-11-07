#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "define.c"

typedef struct {
  char name[MAX_COUNT];
  Node *children[MAX_COUNT];
}Node;

typedef Node* ASTree;

ASTree createASTree(){
  const ASTree root = (ASTree)malloc(sizeof(Node));
  int i;
  for(i=0; i<MAX_COUNT; i++){
    root->name[i] = 0;
    root->children[i] = NULL;
  }
  return root;
}
