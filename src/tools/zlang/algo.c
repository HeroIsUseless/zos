#ifndef ALGO_C
#define ALGO_C
void code_append(char code_part[]){
  char* code_end = code + strlen(code);
  int i;
  for(i=0; i<strlen(code_part); i++){
    code_end[i] = code_part[i];
  }
}

void formatVar_prefix(char var_prefix[]){
  int begin = strlen(var_prefix);
  int end = begin;
  while(begin>-1 && var_prefix[begin]!='/'){
    begin --;
  }
  begin++;
  int i;
  for(i=0; i<end-begin; i++){
    var_prefix[i] = var_prefix[i+begin];
  }
  var_prefix[i] = 0;
  end = strlen(var_prefix);
  for(i=0; i<end; i++){
    if(var_prefix[i] == '.'){
      var_prefix[i] = '_';
    }
  }
  var_prefix[i] = '_';
  var_prefix[++i] = 0;
}
#endif
