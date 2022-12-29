#ifndef map2AsmMAPPER_CPP
#define map2AsmMAPPER_CPP
#include <stdio.h>
#include <string>
#include <iostream>
#include "asmmapper.cpp"
using namespace std;
// 定义宏
#define PopEax map2Asm("pop eax\n");
#define PushEax map2Asm("push eax\n");
#define PopEbx map2Asm("pop ebx\n");
#define PushEbx map2Asm("push ebx\n");
#define PopEbp map2Asm("pop ebp\n");
#define PushEbp map2Asm("push ebp\n");
#define Ret map2Asm("ret\n");

class NasmMapper : public AsmMapper
{
  // 定义标签
  virtual void defTag(string tagName)
  {
    map2Asm(m_astree->getPrefix(), tagName, ":\n");
  }

  // 定义整型4字节变量
  virtual void defVarWithNumber(string varName, string num)
  {
    map2Asm("jmp ", m_astree->getPrefix(), varName, "_pass\n");
    map2Asm(m_astree->getPrefix(), varName, ": dd ", num, "\n");
    map2Asm(m_astree->getPrefix(), varName, "_pass:\n");
  }

  // 定义字符串
  virtual void defVarWithString(string varName, string str)
  {
    map2Asm("jmp ", m_astree->getPrefix(), varName, "_pass\n");
    map2Asm(m_astree->getPrefix(), varName, ": dd ", str, "\n");
    map2Asm(m_astree->getPrefix(), varName, "_pass:\n");
  }

  // 定义数组前半部分
  virtual void defArrayStart(string arrName)
  {
    map2Asm("jmp ", m_astree->getPrefix(), arrName, "_pass\n");
    map2Asm(m_astree->getPrefix(), arrName, ": dd ");
  }

  // 定义数组的元素
  virtual void defArrayItem(string num)
  {
    map2Asm(num, ", ");
  }

  // 定义数组后半部分
  virtual void defArrayEnd(string arrName)
  {
    map2Asm("\n", m_astree->getPrefix(), arrName, "_pass:\n");
  }

  // 接收函数参数，在后面输出
  virtual void defParam(string varName)
  {
    m_funcParams.push_back(varName);
  }

  // 定义函数前半部分
  virtual void defFunctionStart(string funName)
  {
    map2Asm("\n;############[fun begin]", funName, "############\n");
    map2Asm("jmp ", m_astree->getPrefix(), funName, "_pass\n");
    defTag(funName);
    m_astree->down(funName);
    map2Asm("pop ebp\n");
    for (int i = m_funcParams.size() - 1; i >= 0; i--)
    {
      m_astree->addChild(m_funcParams[i]);
      map2Asm("pop eax\n");
      map2Asm("mv ", m_astree->getPrefix(), m_funcParams[i], ", eax");
    }
    map2Asm("push ebp\n");
    m_funcParams.clear();
  }

  // 定义函数后半部分
  virtual void defFunctionEnd(string funName)
  {
    m_astree->up();
    map2Asm("ret\n");
    map2Asm(";========[fun end]", funName, "========\n");
    map2Asm(m_astree->getPrefix(), funName, "_pass:\n");
  }

  // 函数的return
  virtual void defReturn()
  {
    PopEax
    PopEbp
    PushEax
    PushEbp
    Ret
  }

  // 变量赋值
  virtual void assginVar(string varName)
  {
    PopEax
    map2Asm("mov [", m_astree->getPrefix(), varName, "], eax\n");
  }

  virtual void assginPrefixesVar(string prefixesVarName)
  {
    PopEax
    map2Asm("mov [", prefixesVarName, "], eax\n");
  }

  virtual void assginArray(string arrName)
  {
    PopEax     // var
    PopEbx // index
    map2Asm("mov [", m_astree->getPrefix(), arrName, "+ebx], eax\n");
  }

  virtual void assginPrefixesArray(string prefixesArrName)
  {
    PopEax     // var
    PopEbx // index
    map2Asm("mov [", prefixesArrName, "+ebx], eax\n");
  }

  virtual void ifEnd()
  {
    defTag("end");
    map2Asm(";if end\n");
  }
};

#endif