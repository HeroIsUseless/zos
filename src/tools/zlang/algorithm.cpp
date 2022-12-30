#ifndef ALGORITHM_CPP
#define ALGORITHM_CPP
#include <iostream>
#include <string>
using namespace std;

string getRandomNum() {
  static long random = 0;
  random ++;
  string res = "";
  while(random != 0) {
    int k = random % 10;
    res = res + (char)(k + 48);
    random = random / 10;
  }
  return res;
} 

#endif
