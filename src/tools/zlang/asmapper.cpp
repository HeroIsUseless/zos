#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include <iostream>
#include "asmapper.h"
#include "code.cpp"
#include "astree.cpp"
using namespace std;

AsmMapper *AsmMapper::m_pInstance = NULL;

AsmMapper::AsmMapper(Code *code)
{
  m_code = code;
  m_astree = ASTree::GetInstance();
}

AsmMapper *AsmMapper::GetInstance(Code *code)
{
  if (m_pInstance == NULL)
    m_pInstance = new AsmMapper(code);
  return m_pInstance;
}

void AsmMapper::test()
{
  cout << "==============test================" <<endl;
}

void AsmMapper::jumpVarPass(string varName)
{
  nasm("jmp " + prefixes() + varName + "_pass\n");
}

void AsmMapper::defVarPass(string varName)
{
  nasm(prefixes() + varName + "_pass:\n");
}

void AsmMapper::nasm(string val)
{
  m_code->append(val);
}

string AsmMapper::prefixes()
{
  return "";
}

void AsmMapper::defTag(string tagName)
{
  nasm(prefixes() + tagName + ":\n");
}

void AsmMapper::defVarWithNumber(string varName, string num)
{
  jumpVarPass(varName);
  nasm(prefixes() + varName + ": " + num + "\n");
  defVarPass(varName);
}

void AsmMapper::defVarWithString(string varName, string str)
{
  jumpVarPass(varName);
  nasm(prefixes() + varName + ": " + str + "\n");
  defVarPass(varName);
}

#endif