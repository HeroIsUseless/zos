# ZOS
## 特色功能
zlang的基本单位为zos的基本单位
真正适合程序员的操作系统
## 编译原理
多个.z文件的，首先单个文件编译成asm，
然后zl组合成一个文件zos.asm，
然后用nasm编译成zos.bin，
然后混合ipl.bin，boot.bin，制成zos.img
## 执行原理
开机启动后，先进入IPL.asm，boot.asm，跳转到32位系统
进入32位系统后，由于zos.img中，main.asm在最开始，kernel.asm在最后
代码会全部初始化后执行到kernel.asm，然后执行main.asm的once和loop
注：kernel.asm为什么没有被zlang化，可能是因为懒吧。。
## 文件结构
-build/
-doc/
-example/
-log/
-src/
--boot/
---boot.asm
---IPL.asm
--kernel/
---GDT.z
---IDT.z
---kernel.asm
---memory.z
---PDT.z
--lib/
--screen/
--tools/
--main.z
--test.z
## 下一步计划
添加浮点数功能
添加内存

# ZLANG
## 总体思路
以汇编为基本原理，这样会更容易
多吸取数学，语文的概念，如果有冲突，以汇编为准
跟ZOS高度融合
## 下一步计划
变量的前缀，现在用上一层变量必须加相对前缀，或者传递到参数里，好在现在比较好做了
## 具体实现细节
a: A; [浅拷贝] [汇编层面就是开辟内存，拷贝代码]
a\init(4,6,8); [执行初始化函数]
a: A(1,2,3); [执行函数并赋予返回值，这里所有的写法全部写在return里面了]
函数内返回就是用 .<=1; 或者 func<=1; 也可以返回域，函数什么的
  这个会直接结束当前域的执行
可以在代码界面写执行语句，一旦有执行语句，这个文件夹就会自动变成应用程序不再展开
双击打开map或者数组，双击执行程序，右键菜单打开程序，代码界面有执行按钮
跨域执行需要精确定位变量位置，可以使用环境变量，可以使用父层或子层变量，
  等价于使用文件文件不会说本文件夹找不到，就去找上一层文件夹的，没有这么用的
  一个括号算一个域，大括号不算，map算一个域
  if算一个执行函数，不算域，其参数算一个回调函数，算一个域
变量不存在有一个专门类型invalid，当索引失败时显示
数组从0开始
用@a表示该变量的地址，也就是左值，传来的地址用&addr来获得值
纯数组名字使用，没有任何意义
函数=map=类，都是括号里的东西，因此key可以是数字，字符串，或者变量名
基本变量传递值，复杂变量传递引用，因此复杂变量需要传递@，是手动传递的

# 语法
## 基本语法
按照回车分割语句，如果多条语句在一行，用逗号分割
如果需要多行，则需要在特定的地方断开才行
[不行，比较难做，只能分号了]
```
a<=1;
b<=a;
c<=3, d<=c;
```
## 注释
注释放到中括号里，可以放到代码的任何地方
```
[这是一条注释]
```
或者仅仅有一个左中括号也可以，但无法换行了
```
[这是一条行内注释
```
## 变量
变量有三种基本数据类型，分别是整型，字符串，浮点型，要求变量必须符合zos的基本变量
```
a: 1
a: Int
b: ''
b: String
c: 0.3
c: Float
```
变量必须先声明才能赋值
## 操作符
### 声明运算符
声明运算符为冒号“:”，用来声明变量与函数，变量与函数必须先声明才能赋值或使用
```
a: 1 [变量a声明值为1且为整型]
b: a [变量b声明为a的值和类型]
b <= 3 [变量必须先声明才能赋值]
```
### 赋值运算符
<=或=>或<=>为仅仅赋值，不转换类型，如果类型不同会报错
```
a<=b [把b的值赋给a]
a=>b [把a的值赋给b]
a<=>b [a与b的值相互交换]
```
### 算数运算符
+
-
*
/
### 逻辑运算符
<
>
\<
>/
=
# 是不等于
## 数列
数列用花括号表示，选择其中一个元素用\符号，索引从1开始
```
arr: {1, 2, 3}
b: arr\1
```
## 函数
函数示例如下：
```
add(a, b):(.<=a+b)
c <= add(1, 2)
```
不同于其他语言的return，这里是会一直向下执行的
## 条件语句
条件语句示例如下：
```
if(a>b, (.<=a), (.<=b))            [那这个名字算什么？但名字是不行的，别说有if，还有大写类]
```
## 循环语句
循环语句示例如下：
```
while(a>b, (a<=a-1))
```
## 类
类实际上也是一个函数，当函数返回自己时，即返回了一个类实例
```
cls(a:0, b:0):(c:a+b, .<=cls) [这样感觉都有点辩证了，对，这样也是内存原理的]
d: cls(1,2)
```
类属性可以这样使用
```
cls(a:0, b:0):(
  c:0
  d: .\c
  e: .\a+.\b
  f: a+b
)
```

