#ifndef ASMMAPPER_H
#define ASMMAPPER_H
#include <stdio.h>
#include <string>
#include <vector>
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

  void nasm(string snippet);
  string prefixes();
  void jumpVarPass(string varName);
  void defVarPass(string varName);
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
};
#endif