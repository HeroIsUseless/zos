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
  // 最后的asm代码
  string *m_asm;
protected:
  // AST树，用来条件循环语句的计数
  ASTree *m_astree;
  // lang转asm的函数
  template <class T, class ...Args>
  void map2Asm(T head, Args... rest);
  void map2Asm();
  // 用来暂时记录函数的参数
  vector<string> m_funcParams;
public:
  AsmMapper();
  ~AsmMapper();
  string* getAsm();
  // 定义一个tag
  virtual void defTag(string tagName) = 0;
  // 用数值定义一个4字节内存变量
  virtual void defVarWithNumber(string varName, string num) = 0;
  // 用字符串定义一个内存变量
  virtual void defVarWithString(string varName, string str) = 0;
  // 定义数组头部部分
  virtual void defArrayStart(string arrName) = 0;
  // 定义数组尾部部分
  virtual void defArrayEnd(string arrName) = 0;
  // 定义数组中的元素
  virtual void defArrayItem(string num) = 0;
  // 定义函数参数
  virtual void defParam(string varName) = 0;
  // 定义函数头部部分
  virtual void defFunctionStart(string funName) = 0;
  // 定义函数尾部部分
  virtual void defFunctionEnd(string funName) = 0;
  // 定义函数的return
  virtual void defReturn() = 0;
  // 给变量赋值
  virtual void assginVar(string varName) = 0;
  // 给自带前缀的变量赋值
  virtual void assginPrefixesVar(string prefixesVarName) = 0;
  // 给数组赋值
  virtual void assginArray(string arrName) = 0;
  // 给自带前缀的数组赋值
  virtual void assginPrefixesArray(string prefixesArrName) = 0;
  // 定义条件判断的尾部部分
  virtual void ifEnd() = 0;
};

AsmMapper::AsmMapper()
{
  m_asm = new string("");
  m_astree = new ASTree();
}

AsmMapper::~AsmMapper()
{
  delete m_asm;
  delete m_astree;
}

string* AsmMapper::getAsm() 
{
  return this->m_asm;
}

template <class T, class ...Args>
void AsmMapper::map2Asm(T head, Args... rest)
{
  m_asm->append(head);
  map2Asm(rest...);
}

// 上面函数的最终递归
void AsmMapper::map2Asm()
{
  // 可以打一些log
}

#endif
