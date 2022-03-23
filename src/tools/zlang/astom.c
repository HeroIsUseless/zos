void nasm(char val[]){

}

void tag(char val[]){
  nasm(val);
}

void prefixes(){

}

void defTag(char val[]){
  prefixes();tag(val);nasm(":\n");
}