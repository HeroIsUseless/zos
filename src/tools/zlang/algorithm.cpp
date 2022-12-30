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
