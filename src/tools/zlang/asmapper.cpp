#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
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

void AsmMapper::nasm(string val)
{
  m_code->append(val);
}

string AsmMapper::prefixes()
{
}

void AsmMapper::defTag(string tagName)
{
  nasm(prefixes() + tagName + ":\n");
}

void AsmMapper::defVarWithNumber(string varName, string num)
{
  nasm("jmp " + prefixes() + varName + "_pass\n");
  nasm(prefixes() + varName + ": " + num + "\n");
  nasm(prefixes() + varName + "_pass:\n");
}

#endif