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
