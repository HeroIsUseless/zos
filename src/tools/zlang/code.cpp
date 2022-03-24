#ifndef CODE_CPP
#define CODE_CPP
#include <stdio.h>
#include <string>
using namespace std;

class Code{
private:
  string *m_asm;
public:
  Code(){
    m_asm = new string("");
  }
  ~Code(){
    delete m_asm;
  }
  void append(string snippet){
    m_asm->append(snippet);
  }
};
#endif