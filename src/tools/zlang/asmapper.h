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

  void nasm(string val);
  string prefixes();
public:
  static AsmMapper *GetInstance(Code *code);
  
  void defTag(string val);
  void defVarWithNumber(string val1, string val2);
};
#endif