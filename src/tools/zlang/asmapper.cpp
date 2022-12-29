#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include <vector>
#include "astree.cpp"
using namespace std;

class AsmMapper
{
private:
  // 单例模式
  static AsmMapper *m_pInstance;
  // 最后的asm代码
  string *m_asm;
  // AST树，用来条件循环语句的计数
  ASTree *m_astree;
  // 用来暂时记录函数的参数
  vector<string> m_funcParams;
  // 用来暂返回变量名的前缀 TODO: del
  string prefixes();
  // 单例模式（asm是C++关键字）
  AsmMapper();
  // lang转asm的函数
  template <class T, class ...Args>
  void map2Asm(T head, Args... rest);
  void map2Asm();
public:
  static AsmMapper *GetInstance();
  string* getAsm();
  // 定义一个tag
  virtual void defTag(string tagName) const;
  // 用数值定义一个4字节内存变量
  virtual void defVarWithNumber(string varName, string num) const;
  // 用字符串定义一个内存变量
  virtual void defVarWithString(string varName, string str) const;
  // 定义数组头部部分
  virtual void defArrayStart(string arrName) const;
  // 定义数组尾部部分
  virtual void defArrayEnd(string arrName) const;
  // 定义数组中的元素
  virtual void defArrayItem(string num) const;
  // 定义函数参数
  virtual void defParam(string varName) const;
  // 定义函数头部部分
  virtual void defFunctionStart(string funName) const;
  // 定义函数尾部部分
  virtual void defFunctionEnd(string funName) const;
  // 定义函数的return
  virtual void defReturn() const;
  // 给变量赋值
  virtual void assginVar(string varName) const;
  // 给自带前缀的变量赋值
  virtual void assginPrefixesVar(string prefixesVarName) const;
  // 给数组赋值
  virtual void assginArray(string arrName) const;
  // 给自带前缀的数组赋值
  virtual void assginPrefixesArray(string prefixesArrName) const;
  // 定义条件判断的尾部部分
  virtual void ifEnd() const;
};

AsmMapper *AsmMapper::m_pInstance = nullptr;

AsmMapper *AsmMapper::GetInstance()
{
  if (m_pInstance == nullptr)
    m_pInstance = new AsmMapper();
  return m_pInstance;
}

AsmMapper::AsmMapper()
{
  m_asm = new string("");
  m_astree = ASTree::GetInstance();
}

string* AsmMapper::getAsm() 
{
  return this->m_asm;
}

template <class T, class ...Args>
void AsmMapper::map2Asm(T head, Args... rest)
{
  m_code->append(head);
  map2Asm(rest...);
}

// 上面函数的最终递归
void AsmMapper::map2Asm()
{
}

#endif
