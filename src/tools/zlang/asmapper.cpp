#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include <iostream>
#include "asmapper.h"
#include "code.cpp"
#include "astree.cpp"
using namespace std;

AsmMapper *AsmMapper::m_pInstance = nullptr;

AsmMapper::AsmMapper(Code *code)
{
  m_code = code;
  m_astree = ASTree::GetInstance();
}

AsmMapper *AsmMapper::GetInstance(Code *code)
{
  if (m_pInstance == nullptr)
    m_pInstance = new AsmMapper(code);
  return m_pInstance;
}

template <class T, class ...Args>
void AsmMapper::nasm(T head, Args... rest)
{
  m_code->append(head);
  nasm(rest...);
}

void AsmMapper::nasm()
{
}

string AsmMapper::prefixes()
{
  return "";
}

void AsmMapper::defTag(string tagName)
{
  nasm(prefixes(), tagName, ":\n");
}

void AsmMapper::defVarWithNumber(string varName, string num)
{
  nasm("jmp ", prefixes(), varName, "_pass\n");
  nasm(prefixes(), varName, ": ", num, "\n");
  nasm(prefixes(), varName, "_pass:\n");
}

void AsmMapper::defVarWithString(string varName, string str)
{
  nasm("jmp ", prefixes(), varName, "_pass\n");
  nasm(prefixes(), varName, ": ", str, "\n");
  nasm(prefixes(), varName, "_pass:\n");
}

void AsmMapper::defArrayStart(string arrName)
{
  nasm("jmp ", prefixes(), arrName, "_pass\n");
  nasm(prefixes(), arrName, ": ");
}

void AsmMapper::defArrayEnd(string arrName)
{
  nasm("\n");
  nasm(prefixes(), arrName, "_pass:\n");
}

void AsmMapper::defArrayItem(string num){
  nasm(num + ", ");
}
void AsmMapper::defParam(string varName){
  m_params.push_back(varName);
}
void AsmMapper::defFunctionStart(string funName){
  nasm("\n;############[fun begin]"+funName+"############\n");
  nasm("jmp ", prefixes(), funName, "_pass\n");
  defTag(funName);
  m_astree->down(funName);
  nasm("pop ebp\n");
  for(int i=m_params.size()-1; i>=0; i--){
    m_astree->addChild(m_params[i]);
    nasm("pop eax\n");
    nasm("mv ", prefixes(), m_params[i], ", eax");
  }
  nasm("push ebp\n");
  m_params.clear();
}

void AsmMapper::defFunctionEnd(string funName){
  m_astree->up();
  nasm("ret\n");
  nasm(";========[fun end]", funName, "========\n");
  nasm(prefixes(), funName, "_pass:\n");
}

void AsmMapper::defReturn(){
  PopEax
  PopEbp
  PushEax
  PushEbp
  Ret
}

void AsmMapper::assginVar(string varName){
  PopEax
  nasm("mov [", prefixes(), varName, "], eax\n");
}

void AsmMapper::assginPrefixesVar(string prefixesVarName){
  PopEax
  nasm("mov [", prefixesVarName, "], eax\n");
}

void AsmMapper::assginArray(string arrName){
  PopEax // var
  PopEbx // index
  nasm("mov [", prefixes(), arrName, "+ebx], eax\n");
}

void AsmMapper::assginPrefixesArray(string prefixesArrName){

}
#endif