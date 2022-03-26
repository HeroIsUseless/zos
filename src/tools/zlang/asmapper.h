#ifndef ASMMAPPER_H
#define ASMMAPPER_H
#include <stdio.h>
#include <string>
#include <vector>
#include "code.cpp"
#include "astree.cpp"
#define PopEax nasm("pop eax\n");
#define PushEax nasm("push eax\n");
#define PopEbx nasm("pop ebx\n");
#define PushEbx nasm("push ebx\n");
#define PopEbp nasm("pop ebp\n");
#define PushEbp nasm("push ebp\n");
#define Ret nasm("ret\n");
using namespace std;

class AsmMapper
{
private:
  static AsmMapper *m_pInstance;
  Code *m_code;
  ASTree *m_astree;
  vector<string> m_params;
  AsmMapper(Code *code);
  template <class T, class ...Args>
  void nasm(T head, Args... rest);
  void nasm();
  string prefixes();
public:
  static AsmMapper *GetInstance(Code *code);
  void defTag(string tagName);
  void defVarWithNumber(string varName, string num);
  void defVarWithString(string varName, string str);
  void defArrayStart(string arrName);
  void defArrayEnd(string arrName);
  void defArrayItem(string num);
  void defParam(string varName);
  void defFunctionStart(string funName);
  void defFunctionEnd(string funName);
  void defReturn();
  void assginVar(string varName);
  void assginPrefixesVar(string prefixesVarName);
  void assginArray(string arrName);
  void assginPrefixesArray(string prefixesArrName);
};
#endif