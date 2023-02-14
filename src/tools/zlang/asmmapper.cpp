#ifndef ASMMAPPER_CPP
#define ASMMAPPER_CPP
#include <stdio.h>
#include <string>
#include <vector>
#include "astree.cpp"
#include "algorithm.cpp"
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
  AsmMapper(char *fileName);
  ~AsmMapper();
  string* getAsm();
  // 用数值定义一个4字节内存变量
  virtual void defVarWithNumber(string varName) = 0;
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
  // 给数组元素赋值
  virtual void assginArrayItem(string arrName) = 0;
  // 给自带前缀的数组赋值
  virtual void assginPrefixesArray(string prefixesArrName) = 0;
  virtual void pushArrayItem(string arrName) = 0;
  // 表达式部分：将数字压入堆栈
  virtual void pushInt(string integer) = 0;
  virtual void pushVar(string var) = 0;
  virtual void pushPrefixesVar(string prefixedVar) = 0;
  virtual void pushVarByTest(string address) = 0;
  virtual void pushVarByPrefixedTest(string prefixedAddress) = 0;
  virtual void pushVarByAddr(string address) = 0;
  virtual void pushVarByPrefixedAddr(string prefixedAddress) = 0;
  virtual void pushAddress(string address) = 0;
  virtual void pushPrefixedAddress(string prefixedAddress) = 0;
  virtual void pushPrefixedArrayItem(string prefixedAddress) = 0;
  virtual void pushArrayItemAddr(string arrayName) = 0;
  virtual void pushPrefixedArrayItemAddr(string prefixedAddl) = 0;
  virtual void callFunction(string functionName) = 0;
  virtual void callPrefixesFunction(string functionName) = 0;
  virtual void defIfHead() = 0;
  virtual void defIfThen() = 0;
  virtual void defIfElse() = 0;
  virtual void defIfEnd() = 0;
  virtual void defWhileHead() = 0;
  virtual void defWhileMid() = 0;
  virtual void defWhileEnd() = 0;
  virtual void add() = 0;
  virtual void floatAdd() = 0;
  virtual void sub() = 0;
  virtual void les() = 0;
  virtual void mor() = 0;
  virtual void leq() = 0;
  virtual void meq() = 0;
  virtual void shr() = 0;
  virtual void shl() = 0;
  virtual void equ() = 0;
  virtual void neq() = 0;
  virtual void mul() = 0;
  virtual void div() = 0; 
};

AsmMapper::AsmMapper(char *fileName)
{
  m_asm = new string("");
  m_astree = new ASTree(fileName);
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
