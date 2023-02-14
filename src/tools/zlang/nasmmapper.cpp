#ifndef map2AsmMAPPER_CPP
#define map2AsmMAPPER_CPP
#include <stdio.h>
#include <string>
#include <iostream>
#include "asmmapper.cpp"
#include "algorithm.cpp"
using namespace std;

class NasmMapper : public AsmMapper
{
public:
  NasmMapper(char* fileName) : AsmMapper(fileName) {}

  // 定义整型4字节变量
  virtual void defVarWithNumber(string varName)
  {
    varName = formatPrefixes(varName);
    m_astree->addChild(varName);
    map2Asm("jmp ", m_astree->getPrefix(varName), varName, "$pass\n");
    map2Asm(m_astree->getPrefix(varName), varName, ": dd 0", "\n");
    map2Asm(m_astree->getPrefix(varName), varName, "$pass:\n");
    map2Asm("pop eax\n");
    map2Asm("mov [", m_astree->getPrefix(varName), varName, "], eax\n\n");
  }

  // 定义字符串
  virtual void defVarWithString(string varName, string str)
  {
    varName = formatPrefixes(varName);
    m_astree->addChild(varName);
    map2Asm("jmp ", m_astree->getPrefix(varName), varName, "$pass\n");
    map2Asm(m_astree->getPrefix(varName), varName, ": dd 0, ", str, ", 0\n");
    map2Asm(m_astree->getPrefix(varName), varName, "$pass:\n");
  }

  // 定义数组前半部分
  virtual void defArrayStart(string arrName)
  {
    arrName = formatPrefixes(arrName);
    m_astree->addChild(arrName);
    map2Asm("jmp ", m_astree->getPrefix(arrName), arrName, "$pass\n");
    map2Asm(m_astree->getPrefix(arrName), arrName, ": dd 0 \\\n");
  }

  // 定义数组的元素
  virtual void defArrayItem(string num)
  {
    map2Asm(num, ", ");
  }

  // 定义数组后半部分
  virtual void defArrayEnd(string arrName)
  {
    arrName = formatPrefixes(arrName);
    map2Asm("\n", m_astree->getPrefix(arrName), arrName, "$pass:\n");
    map2Asm("mov eax, ", m_astree->getPrefix(arrName), arrName, "\n");
    map2Asm("mov eax, [", m_astree->getPrefix(arrName), arrName, "+4]\n\n");
  }

  // 接收函数参数，在后面输出
  virtual void defParam(string varName)
  {
    varName = formatPrefixes(varName);
    m_funcParams.push_back(varName);
  }

  // 定义函数前半部分
  virtual void defFunctionStart(string funName)
  {
    funName = formatPrefixes(funName);
    m_astree->addChild(funName);
    map2Asm("\n;############[fun begin]", funName, "############\n");
    map2Asm("jmp ", m_astree->getPrefix(funName), funName, "$pass\n");
    map2Asm(m_astree->getPrefix(funName), funName, ":\n");
    m_astree->down(funName);
    map2Asm("pop ebp\n");
    for (int i = m_funcParams.size() - 1; i >= 0; i--)
    {
      m_astree->addChild(m_funcParams[i]);
      map2Asm(";param: ", m_funcParams[i], "\n");
      map2Asm("jmp ", m_astree->getPrefix(m_funcParams[i]), m_funcParams[i], "$pass\n");
      map2Asm(m_astree->getPrefix(m_funcParams[i]), m_funcParams[i], ": dd 0", "\n");
      map2Asm(m_astree->getPrefix(m_funcParams[i]), m_funcParams[i], "$pass:\n");
      map2Asm("pop eax\n");
      map2Asm("mov [", m_astree->getPrefix(m_funcParams[i]), m_funcParams[i], "], eax\n");
    }
    map2Asm("push ebp\n");
    m_funcParams.clear();
  }

  // 定义函数后半部分
  virtual void defFunctionEnd(string funName)
  {
    funName = formatPrefixes(funName);
    m_astree->up();
    map2Asm("ret\n");
    map2Asm(m_astree->getPrefix(funName), funName, "$pass:\n");
    map2Asm(";============[fun end]", funName, "=============\n\n");
  }

  // 函数的return
  virtual void defReturn()
  {
    map2Asm("pop eax\n");
    map2Asm("pop ebp\n");
    map2Asm("push eax\n");
    map2Asm("push ebp\n");
    map2Asm("ret\n");
  }

  // 变量赋值
  virtual void assginVar(string varName)
  {
    varName = formatPrefixes(varName);
    map2Asm("pop eax\n");
    map2Asm("mov [", m_astree->getPrefix(varName), varName, "], eax\n");
  }

  virtual void assginPrefixesVar(string prefixesVarName)
  {
    prefixesVarName = formatPrefixes(prefixesVarName);
    map2Asm("pop eax\n");
    map2Asm("mov [", prefixesVarName, "], eax\n");
  }

  virtual void assginArrayItem(string arrName)
  {
    arrName = formatPrefixes(arrName);
    map2Asm("pop edx\n");
    map2Asm("pop eax\n");
    map2Asm("mov ebx, 4\n");
    map2Asm("mul ebx\n");
    map2Asm("mov [", m_astree->getPrefix(arrName), arrName, "+eax], edx\n\n");
  }

  virtual void assginPrefixesArray(string prefixesArrName)
  {
    prefixesArrName = formatPrefixes(prefixesArrName);
    map2Asm("pop eax\n");     // var
    map2Asm("pop ebx\n"); // index
    map2Asm("mov [", prefixesArrName, "+ebx], eax\n");
  }

  virtual void pushArrayItem(string arrName)
  {
    arrName = formatPrefixes(arrName);
    map2Asm("pop eax\n");
    map2Asm("mov ebx, 4\n");
    map2Asm("mul ebx\n");
    map2Asm("mov ebx, [", m_astree->getPrefix(arrName), arrName, "+eax]\n");
    map2Asm("push ebx\n");
  }

  virtual void pushInt(string integer)
  {
    map2Asm("mov eax, ", integer, "\n");
    map2Asm("push eax\n");
  }

  virtual void pushVar(string var)
  {
    var = formatPrefixes(var);
    map2Asm("mov eax, [", m_astree->getPrefix(var), var, "]\n");
    map2Asm("push eax\n");
  }

  virtual void pushPrefixesVar(string prefixedVar)
  {
    prefixedVar = formatPrefixes(prefixedVar);
    map2Asm("mov eax, [", prefixedVar, "]\n");
    map2Asm("push eax\n");
  }

  /*测试运算符，表示右移4*3=12个*/
  virtual void pushVarByTest(string var) {
    var = formatPrefixes(var);
    map2Asm("mov eax, [", m_astree->getPrefix(var), var, "]\n");
    map2Asm("shr eax, 24\n");
    map2Asm("push eax\n");
  }

  virtual void pushVarByPrefixedTest(string prefixedVar) {
    prefixedVar = formatPrefixes(prefixedVar);
    map2Asm("mov eax, [", prefixedVar, "]\n");
    map2Asm("shr eax, 24\n");
    map2Asm("push eax\n");
  }

  /*该变量的值是另一个变量的地址，将另一个变量的值返回*/
  virtual void pushVarByAddr(string address) {
    address = formatPrefixes(address);
    map2Asm("mov eax, [", m_astree->getPrefix(address), address, "]\n");
    map2Asm("mov ebx, [eax]\n");
    map2Asm("push ebx\n");
  }

  virtual void pushVarByPrefixedAddr(string prefixedAddress) {
    prefixedAddress = formatPrefixes(prefixedAddress);
    map2Asm("mov eax, [", prefixedAddress, "]\n");
    map2Asm("mov ebx, [eax]\n");
    map2Asm("push ebx\n");
  }

  virtual void pushAddress(string address) 
  {
    address = formatPrefixes(address);
    map2Asm("mov eax, ", m_astree->getPrefix(address), address, "\n");
    map2Asm("push eax\n");
  }

  virtual void pushPrefixedAddress(string prefixedAddress)
  {
    prefixedAddress = formatPrefixes(prefixedAddress);
    map2Asm("mov eax, ", prefixedAddress, "\n");
    map2Asm("push eax\n");
  }

  virtual void pushPrefixedArrayItem(string prefixedAddress)
  {
    prefixedAddress = formatPrefixes(prefixedAddress);
    map2Asm("pop eax\n");
    map2Asm("mov ebx, 4\n");
    map2Asm("mul ebx\n");
    map2Asm("mov ebx, [", prefixedAddress, "+eax]\n");
    map2Asm("push ebx\n");
  }

  virtual void pushArrayItemAddr(string arrayName) 
  {
    arrayName = formatPrefixes(arrayName);
    map2Asm("mov ebx, 4\n");
    map2Asm("pop eax\n");
    map2Asm("mul ebx\n");
    map2Asm("mov edx, ", m_astree->getPrefix(arrayName), arrayName, "+eax\n");



    map2Asm("mov ebx, eax\n");
    map2Asm("mov eax, [", m_astree->getPrefix(arrayName), arrayName, "]\n");
    map2Asm("add eax, ebx\n");
    map2Asm("mov ebx, [eax]\n");
    map2Asm("push eax\n");
  }

  virtual void pushPrefixedArrayItemAddr(string prefixedAddl)
  {
    prefixedAddl = formatPrefixes(prefixedAddl);
    map2Asm("mov ebx, 4\n");
    map2Asm("pop eax\n");
    map2Asm("mul ebx\n");
    map2Asm("mov ebx, eax\n");
    map2Asm("mov eax, [", prefixedAddl, "]\n");
    map2Asm("add eax, ebx\n");
    map2Asm("mov ebx, [eax]\n");
    map2Asm("push eax\n");
  }

  virtual void callPrefixesFunction(string functionName)
  {
    functionName = formatPrefixes(functionName);
    map2Asm("call ", functionName, "\n\n");
  }

  virtual void callFunction(string functionName)
  {
    functionName = formatPrefixes(functionName);
    map2Asm("call ", m_astree->getPrefix(functionName), functionName, "\n\n");
  }

  virtual void defIfHead()
  {
    m_astree->addChild("if");
    m_astree->down("if");
    map2Asm(";########## ",m_astree->getPrefix("if"), "$start ##########\n");
  }

  virtual void defIfThen()
  {
    map2Asm("pop eax\n");
    map2Asm("cmp eax, 0\n");
    map2Asm("je ", m_astree->getPrefix("if"), "$else\n");
  }

  virtual void defIfElse()
  {
    map2Asm("jmp ", m_astree->getPrefix("if"), "$end\n");
    map2Asm(m_astree->getPrefix("if"), "$else:\n");
  }

  virtual void defIfEnd()
  {
    map2Asm(m_astree->getPrefix("if"), "$end:\n");
    map2Asm(";========== ", m_astree->getPrefix("if"), "$end ==========\n\n");
    m_astree->up();
  }

  virtual void defWhileHead()
  {
    m_astree->addChild("while");
    m_astree->down("while");
    map2Asm(";########## ", m_astree->getPrefix("while"), "$start ##########\n");
    map2Asm(m_astree->getPrefix("while"), "$start:\n");
  }

  virtual void defWhileMid()
  {
    map2Asm("pop eax\n");
    map2Asm("cmp eax, 0\n");
    map2Asm("je ", m_astree->getPrefix("while"), "$end\n");
  }

  virtual void defWhileEnd()
  {
    map2Asm("jmp ", m_astree->getPrefix("while"), "$start\n");
    map2Asm(m_astree->getPrefix("while"), "$end:\n");
    map2Asm(";========== ", m_astree->getPrefix("while"), "$end ==========\n\n");
    m_astree->up();
  }

  virtual void add()
  {
    map2Asm("pop eax\n");
    map2Asm("pop ebx\n");
    map2Asm("add eax, ebx\n");
    map2Asm("push eax\n");
  }

  virtual void floatAdd(){
    map2Asm("pop eax\n");
    map2Asm("pop ebx\n");
    map2Asm("add eax, ebx\n");
    map2Asm("push eax\n");
  }

  virtual void sub()
  {
    map2Asm("pop eax\n");
    map2Asm("pop ebx\n");
    map2Asm("sub eax, ebx\n");
    map2Asm("push eax\n");
  }

  virtual void les()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("jb ", m_astree->getPrefix("logic"), "les#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "les#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"les#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"les#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void shr()
  {
    map2Asm("pop ecx\n");
    map2Asm("pop eax\n");
    map2Asm("shr eax, cl\n");
    map2Asm("push eax\n");
  }

  virtual void shl()
  {
    map2Asm("pop ecx\n");
    map2Asm("pop eax\n");
    map2Asm("shl eax, cl\n");
    map2Asm("push eax\n");
  }

  virtual void mor()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("ja ", m_astree->getPrefix("logic"), "mor#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "mor#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"mor#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"mor#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void leq()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("jbe ", m_astree->getPrefix("logic"), "leq#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "leq#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"leq#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"leq#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void meq()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("jae ", m_astree->getPrefix("logic"), "meq#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "meq#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"meq#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"meq#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void equ()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("je ", m_astree->getPrefix("logic"), "equ#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "equ#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"equ#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"equ#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void neq()
  {
    string randomNum = getRandomNum();
    map2Asm("pop ebx\n");
    map2Asm("pop eax\n");
    map2Asm("cmp eax, ebx\n");
    map2Asm("jne ", m_astree->getPrefix("logic"), "neq#", randomNum, "$true\n");
    map2Asm("mov eax, 0\n");
    map2Asm("jmp ", m_astree->getPrefix("logic"), "neq#", randomNum, "$false\n");
    map2Asm( m_astree->getPrefix("logic"),"neq#", randomNum, "$true:\n");
    map2Asm("mov eax, 1\n");
    map2Asm( m_astree->getPrefix("logic"),"neq#", randomNum, "$false:\n");
    map2Asm("push eax\n");
  }

  virtual void mul()
  {
    map2Asm("pop eax\n");
    map2Asm("pop ebx\n");
    map2Asm("mul ebx\n");
    map2Asm("push eax\n");
  }

  virtual void div()
  {
    map2Asm("pop eax\n");
    map2Asm("pop ebx\n");
    map2Asm("div ebx\n");
    map2Asm("push eax\n");
  }
 
};

#endif