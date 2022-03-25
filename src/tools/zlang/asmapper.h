#ifndef ASMMAPPER_H
#define ASMMAPPER_H
#include <stdio.h>
#include <string>
#include "code.cpp"
#include "astree.cpp"
using namespace std;

class AsmMapper
{
private:
  static AsmMapper *m_pInstance;
  Code *m_code;
  ASTree *m_astree;
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
};
#endif