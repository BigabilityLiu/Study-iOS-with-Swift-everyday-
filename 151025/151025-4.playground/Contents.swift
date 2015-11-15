//: Playground - noun: a place where people can play
//基本操作

import Cocoa
//使用＋连接两个字符串
var str1 = "Hello"
var str2 = ", playground"
print(str1+str2)

let a = 9%4
let b = 9%(-4)//在对负数 b 求余时，b 的符号会被忽略。所以 a % b 和 a % -b的结果是相同的。
let c = 9%2.5//swift中可以对小数取余数
var d = 4
++d
d++
//除非你需要使用 i++ 的特性，不然推荐你使用 ++i 和 --i ，因为先修改后返回这样的行为更符合我们的逻辑。

for i in 1..<3{//(1,3)开区间
    print(i)
}