#ifndef ALGORITHM_CPP
#define ALGORITHM_CPP
#include <iostream>
#include <string>
using namespace std;

string getRandomNum() {
  static long random = 0;
  random ++;
  string res = "";
  int t_random = random;
  while(t_random != 0) {
    int k = t_random % 10;
    res = res + (char)(k + 48);
    t_random = t_random / 10;
  }
  return "r"+res;
} 

string formatPrefixes(string prefixesVar) {
  string res = prefixesVar;
  for(int i=0; i<res.size(); i++) {
    if(res[i] == '.' || res[i] == '\\') {
      res[i] = '_';
    }
  }
  return res;
}

#endif
