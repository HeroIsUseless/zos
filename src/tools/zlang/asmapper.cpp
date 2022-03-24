#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include "asmapper.h"
#include "code.cpp"
#include "astree.cpp"
using namespace std;

AsmMapper* AsmMapper::m_pInstance = NULL;

AsmMapper::AsmMapper(Code *code)
{
  m_code = code;
  m_astree = ASTree::GetInstance();
}

AsmMapper* AsmMapper::GetInstance(Code *code)
{
  if (m_pInstance == NULL)
    m_pInstance = new AsmMapper(code);
  return m_pInstance;
}


void AsmMapper::nasm(string val){
  m_code->append(val);
}

void AsmMapper::prefixes(){

}

void AsmMapper::tag(string val){
  prefixes();
  nasm(val);
}

void AsmMapper::number(string val){
  nasm(val);
}

void AsmMapper::addr(string val){
  prefixes();
  nasm(val);
}

void AsmMapper::var(string val){
  nasm("[");
  nasm(val);
  nasm("]");
}

void AsmMapper::defTag(string val){
  tag(val);
  nasm(":\n");
}

void AsmMapper::defVarWithNumber(char val1[], char val2[]){
  prefixes();
  tag(val1);
  nasm(": ");
  number(val2);
  nasm("\n");
}

#endif