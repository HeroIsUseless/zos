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
  static ASTree *m_pInstance;
  ASNode* root;
  ASNode* pNode;
  ASTree() {
    pNode = root = new ASNode();
  }
public:
  static ASTree *GetInstance()
  {
    if (m_pInstance == NULL)
      m_pInstance = new ASTree();
    return m_pInstance;
  }

  void down(string name){
    ASNode* tNode = new ASNode(name);
    tNode->parent = pNode;
    pNode->children.push_back(tNode);
    pNode = tNode;
  }

  void up(){
    if(pNode == root) return;
    pNode = pNode->parent;
  }

  string getPrefix(){
    string prefix = "_";
    ASNode* tNode = pNode;
    while(tNode != root){
      prefix = tNode->name + "_" + prefix;
      tNode = tNode->parent;
    }
    return prefix;
  }
};
// init static member
ASTree* ASTree::m_pInstance = NULL;
#endif