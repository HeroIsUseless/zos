#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include <iostream>
#include "asmapper.cpp"
using namespace std;
// 定义宏
#define PopEax nasm("pop eax\n");
#define PushEax nasm("push eax\n");
#define PopEbx nasm("pop ebx\n");
#define PushEbx nasm("push ebx\n");
#define PopEbp nasm("pop ebp\n");
#define PushEbp nasm("push ebp\n");
#define Ret nasm("ret\n");

class NasmMapper: public AsmMapper {};

// 定义tag
void NasmMapper::defTag(string tagName)
{
  map2Asm(prefixes(), tagName, ":\n");
}

// 定义整型4字节变量
void AsmMapper::defVarWithNumber(string varName, string num)
{
  nasm("jmp ", prefixes(), varName, "_pass\n");
  nasm(prefixes(), varName, ": dd ", num, "\n");
  nasm(prefixes(), varName, "_pass:\n");
}

// 定义字符串
void AsmMapper::defVarWithString(string varName, string str)
{
  nasm("jmp ", prefixes(), varName, "_pass\n");
  nasm(prefixes(), varName, ": dd ", str, "\n");
  nasm(prefixes(), varName, "_pass:\n");
}

// 定义数组前半部分
void AsmMapper::defArrayStart(string arrName)
{
  nasm("jmp ", prefixes(), arrName, "_pass\n");
  nasm(prefixes(), arrName, ": dd ");
}

// 定义数组的元素
void AsmMapper::defArrayItem(string num){
  nasm(num, ", ");
}

// 定义数组后半部分
void AsmMapper::defArrayEnd(string arrName)
{
  nasm("\n", prefixes(), arrName, "_pass:\n");
}

// 接收函数参数，在后面输出
void AsmMapper::defParam(string varName){
  m_params.push_back(varName);
}

// 定义函数前半部分
void AsmMapper::defFunctionStart(string funName){
  nasm("\n;############[fun begin]", funName, "############\n");
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

// 定义函数后半部分
void AsmMapper::defFunctionEnd(string funName){
  m_astree->up();
  nasm("ret\n");
  nasm(";========[fun end]", funName, "========\n");
  nasm(prefixes(), funName, "_pass:\n");
}

// 函数的return
void AsmMapper::defReturn(){
  PopEax
  PopEbp
  PushEax
  PushEbp
  Ret
}

// 变量赋值
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
  PopEax // var
  PopEbx // index
  nasm("mov [", prefixesArrName, "+ebx], eax\n");
}

void AsmMapper::ifEnd(){
  defTag("end");
  nasm(";if end\n");
}
#endif