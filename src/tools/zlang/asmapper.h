#ifndef ASMMAPPER_H
#define ASMMAPPER_H
#include <stdio.h>
#include <string>
#include <vector>
#include "stdarg.h"
#include "code.cpp"
#include "astree.cpp"
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
  void popEax();
  void pushEax();
  void popEbx();
  void pushEbx();
  void popEbp();
  void pushEbp();
  void jumpVarPass(string varName);
  void defVarPass(string varName);
  void ret();
public:
  static AsmMapper *GetInstance(Code *code);
  void test();
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