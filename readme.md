图像添加浮点数功能
  跟整数是放在一起的。。。
  也就是说有自动转换
  自动转换是真不好搞，在运算过程中就能够自动转换，就需要语义的支持
  '+' '.' 感觉还可以
  但前后位置怎么判定呢？
  能有什么说头呢？
  只是感觉更清晰而已
  也很容易更换的
  看来再加一个表示float的一个count了，不过这个相当好做了感觉
  prefix_float$1: dd 1.234
  mov eax, [xxxx]
  浮点数不好搞
添加内存

# 组成原理
进入32位系统后，会执行 kernel\kernel.asm 这个文件，这个文件在编译时放到最后确保所有代码都会初始化
这里就执行了 main.z 的 run.once 和 run.loop
GDT，IDT的初始化就放在 run.once 这里

GDT_set有点难啊，还有左移运算

# zlang
以汇编为基本原理，这样会更容易

a: A; [浅拷贝] [汇编层面就是开辟内存，拷贝代码]
a\init(0); [执行初始化函数]
a: A(); [执行函数返回值]

数组从0开始

# zos
基本类型是 
布尔型bool 1位
字符型char 1字节
整型integer 4字节
浮点型float 4字节
缓冲区类型buffer 不定，最低1位，最高不限[例如应用程序就是二进制的，就是缓冲区类型]
所有类型创建都初始化/不初始化 invalid，因为性能问题必须这样，可以写入但不可读取
有一个不存在类型invalid

组合类型是
数组类型array
字符串类型string [注意字符数组不是字符串，字符串是包括编码格式的]
映射类型map

支持解释型脚本和二进制应用程序(提高效率)
文件浏览器就是上边是图形界面，下边是代码界面，所以文件结构就是一个大json
可以在代码界面写执行语句，一旦有执行语句，这个文件夹就会自动变成应用程序不再展开
双击打开map或者数组，双击执行程序，右键菜单打开程序，代码界面有执行按钮
跨域需要精确定位变量位置，可以使用环境变量，可以使用父层或子层变量
但是if不就是一层吗
变量不存在有一个专门类型invalid
那么解释型代码怎么在图形中表现呢？
不表现，转成应用程序
那么里面的变量也全部不表示了
快捷方式就是别的变量，甚至可以加点料

应用程序之所以不同，是因为里面有if或者while的分层




