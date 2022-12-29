#ifndef ASTREE_CPP
#define ASTREE_CPP
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct ASNode
{
  string name;
  ASNode* parent;
  vector<ASNode*> children;
  void init(){ parent = NULL; }
  ASNode(){ init(); }
  ASNode(string name){
    init();
    this->name = name;
  }
  ASNode(char* name){
    string t_name = string(name);
    int i;
    for(i=t_name.size()-1; i>=0; i--) {
      if(t_name[i] == '.') {
        t_name[i] = '_';
      }
      if(t_name[i] == '\\' || t_name[i] == '/') {
        break;
      }
    }
    // 此时i应该在分隔线处或者为-1，表示没找到分隔线
    if(i != -1) {
      t_name = t_name.substr(i+1, t_name.size()-i);
    }
    cout << "zws 4634 " << t_name << endl;
    this->name = t_name;
  }
};

class ASTree
{
private:
  // 根节点
  ASNode* m_root;
  // 当前所在节点
  ASNode* m_nowNode;

public:
  ASTree(char *fileName) {
    m_nowNode = m_root = new ASNode(fileName);
  }

  void up(){
    if(m_nowNode == m_root) return;
    m_nowNode = m_nowNode->parent;
  }

  void down(string name){
    ASNode* tNode = new ASNode(name);
    tNode->parent = m_nowNode;
    m_nowNode->children.push_back(tNode);
    m_nowNode = tNode;
  }

  string getPrefix(){
    string prefix = "";
    ASNode* tNode = m_nowNode;
    while(tNode){
      prefix = tNode->name + "@" + prefix;
      tNode = tNode->parent;
    }
    return prefix;
  }
  
};

#endif
