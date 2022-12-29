#ifndef NASMMAPPER_CPP
#define NASMMAPPER_CPP
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
    nasm("jmp ", m_astree->getPrefix(), varName, "_pass\n");
    nasm(m_astree->getPrefix(), varName, ": dd ", num, "\n");
    nasm(m_astree->getPrefix(), varName, "_pass:\n");
  }

  // 定义字符串
  virtual void defVarWithString(string varName, string str)
  {
    nasm("jmp ", m_astree->getPrefix(), varName, "_pass\n");
    nasm(m_astree->getPrefix(), varName, ": dd ", str, "\n");
    nasm(m_astree->getPrefix(), varName, "_pass:\n");
  }

  // 定义数组前半部分
  virtual void defArrayStart(string arrName)
  {
    nasm("jmp ", m_astree->getPrefix(), arrName, "_pass\n");
    nasm(m_astree->getPrefix(), arrName, ": dd ");
  }

  // 定义数组的元素
  virtual void defArrayItem(string num)
  {
    nasm(num, ", ");
  }

  // 定义数组后半部分
  virtual void defArrayEnd(string arrName)
  {
    nasm("\n", m_astree->getPrefix(), arrName, "_pass:\n");
  }

  // 接收函数参数，在后面输出
  virtual void defParam(string varName)
  {
    m_params.push_back(varName);
  }

  // 定义函数前半部分
  virtual void defFunctionStart(string funName)
  {
    nasm("\n;############[fun begin]", funName, "############\n");
    nasm("jmp ", m_astree->getPrefix(), funName, "_pass\n");
    defTag(funName);
    m_astree->down(funName);
    nasm("pop ebp\n");
    for (int i = m_params.size() - 1; i >= 0; i--)
    {
      m_astree->addChild(m_params[i]);
      nasm("pop eax\n");
      nasm("mv ", m_astree->getPrefix(), m_params[i], ", eax");
    }
    nasm("push ebp\n");
    m_params.clear();
  }

  // 定义函数后半部分
  virtual void defFunctionEnd(string funName)
  {
    m_astree->up();
    nasm("ret\n");
    nasm(";========[fun end]", funName, "========\n");
    nasm(m_astree->getPrefix(), funName, "_pass:\n");
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
        nasm("mov [", m_astree->getPrefix(), varName, "], eax\n");
  }

  virtual void assginPrefixesVar(string prefixesVarName)
  {
    PopEax
        nasm("mov [", prefixesVarName, "], eax\n");
  }

  virtual void assginArray(string arrName)
  {
    PopEax     // var
        PopEbx // index
            nasm("mov [", m_astree->getPrefix(), arrName, "+ebx], eax\n");
  }

  virtual void assginPrefixesArray(string prefixesArrName)
  {
    PopEax     // var
        PopEbx // index
            nasm("mov [", prefixesArrName, "+ebx], eax\n");
  }

  virtual void ifEnd()
  {
    defTag("end");
    nasm(";if end\n");
  }
};

#endif