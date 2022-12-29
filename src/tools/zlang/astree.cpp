#ifndef ASTREE_CPP
#define ASTREE_CPP
#include <stdio.h>
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
};

class ASTree
{
private:
  // 根节点
  ASNode* m_root;
  // 当前所在节点
  ASNode* m_nowNode;

public:
  ASTree() {
    m_nowNode = m_root = new ASNode();
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
    string prefix = "_";
    ASNode* tNode = m_nowNode;
    while(tNode != m_root){
      prefix = tNode->name + "_" + prefix;
      tNode = tNode->parent;
    }
    return prefix;
  }
  
};

#endif
