添加字母功能
那就需要添加字符串功能
字符串的使用实际上就转化为数字，ascii码
例如：
str: "ABCD";
转化为：
str dd 32, 33, 34, 35, 0
然后使用的话，就是传入这个数组，一直打印，直到0为止
这样也可以随意更改字符串，但是需要传地址，也就是@str
但是这样的话，实际上vramAddr也是需要传，不不，不需要传，它的值就是地址
不然传来的就是第一个值了
@str
形参就是strAddr就酱，然后一直输出，直到0为止

画像素是需要addr的，屏幕addr，和文字addr

普通变量是传值进去的，数组是传地址进去的，因为这是指针，指针传递特性与普通变量不一样
既然传入的是地址，那么形参和实参是完全不一样的

如果要用的话，emmm，关键是汇编代码不支持，传地址，传值，就是如此
可能用&了，代表引用，emmmm，当然，这个以后再说的，现在应该用不到

函数返回不太容易，因为这是call的问题