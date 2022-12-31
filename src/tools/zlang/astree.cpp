#ifndef ASTREE_CPP
#define ASTREE_CPP
#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <assert.h>
#include "algorithm.cpp"
using namespace std;

struct ASNode
{
  string name;
  ASNode *parent;
  vector<ASNode *> children;
  void init() { parent = NULL; }
  ASNode() { init(); }
  ASNode(string name)
  {
    init();
    this->name = name;
  }
  ASNode(char *name)
  {
    string t_name = string(name);
    int i;
    for (i = t_name.size() - 1; i >= 0; i--)
    {
      if (t_name[i] == '.')
      {
        t_name[i] = '_';
      }
      if (t_name[i] == '\\' || t_name[i] == '/')
      {
        break;
      }
    }
    // 此时i应该在分隔线处或者为-1，表示没找到分隔线
    if (i != -1)
    {
      t_name = t_name.substr(i + 1, t_name.size() - i);
    }
    this->name = t_name;
  }
};

class ASTree
{
private:
  // 根节点
  ASNode *m_root;
  // 当前所在节点
  ASNode *m_nowNode;

public:
  ASTree(char *fileName)
  {
    m_nowNode = m_root = new ASNode(fileName);
  }

  // 用来退出一个域
  void up()
  {
    if (m_nowNode == m_root)
      return;
    m_nowNode = m_nowNode->parent;
  }

  // 用来存储变量
  void addChild(string name)
  {
    for (int i = 0; i < m_nowNode->children.size(); i++)
    {
      if (name == m_nowNode->children[i]->name)
      {
        cout << "err msg1: dumplicate var name - " << name << endl;
        assert(false);
      }
    }
    ASNode *tNode;
    if(name == "if") {
      tNode = new ASNode(name + "#" + getRandomNum());
    } else if (name == "while") {
      tNode = new ASNode(name + "#" + getRandomNum());
    } else {
      tNode = new ASNode(name);
    }
    tNode->parent = m_nowNode;
    m_nowNode->children.push_back(tNode);
  }

  // 用来进入一个域
  void down(string name)
  {
    int i;
    for (i = m_nowNode->children.size() - 1; i >= 0; i--)
    {
      if (name == "if" && m_nowNode->children[i]->name.substr(0, 3) == "if#")
      {
        break;
      }
      else if (name == "while" && m_nowNode->children[i]->name.substr(0, 6) == "while#")
      {
        break;
      }
      else if (name == m_nowNode->children[i]->name)
      {
        break;
      }
    }
    if(i != -1) {
      m_nowNode = m_nowNode->children[i];
    } else {
      cout << "lang error: 没有此变量：" << name << endl;
      assert(false);
    }
  }

  string getPrefix(string name)
  {
    string prefix = "";
    ASNode *pNode = m_nowNode;
    if(name == "if" || name == "while") {
      // if，while直接返回当前域
    } else {
      // 查看哪一个域有这个变量
      while (pNode)
      {
        int i;
        for (i = 0; i < pNode->children.size(); i++)
        {
          if (name == pNode->children[i]->name)
            break;
        }
        if (i != pNode->children.size())
          break;
        else
          // 说明此域中没有，继续向上查找
          pNode = pNode->parent;
      }
    }
    if (!pNode)
    {
      // 说明查到头也没有
      cout << "并没有此变量: " << name << endl;
      assert(false);
    } else {
      while (pNode)
      {
        prefix = pNode->name + "@" + prefix;
        pNode = pNode->parent;
      }
    }
    return prefix;
  }
};

#endif
