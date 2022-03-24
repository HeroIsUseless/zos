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
  void prefixes();
  void tag(string val);
  void number(string val);
  void addr(string val);
  void var(string val);

public:
  static AsmMapper *GetInstance(Code *code);
  
  void defTag(string val);
  void defVarWithNumber(char val1[], char val2[]);
};
#endif