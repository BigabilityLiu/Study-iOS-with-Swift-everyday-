//: Playground - noun: a place where people can play
//swift基础

import Cocoa
//定义几种不同类型的整数类型，判断范围
var minU8=UInt8.min
var maxU8=UInt8.max
var minU16 = UInt16.min
var maxU16 = UInt16.max
var minU32 = UInt32.min
var maxU32 = UInt32.max
var minInt32 = Int32.min
var maxInt32 = Int32.max
var minInt64 = Int64.min
var maxInt64 = Int64.max
var maxU64 = UInt64.max//溢出
var minU = Int.min//在64位机器上等同于Int64
var maxU = Int.max

let twothousand:UInt16 = 2_000
let one:UInt = 1
let two = UInt(twothousand) + one

let i = 1;
//if i{ //报错，如果是 if i ==1 就不会报错
    
//}
//元祖
let k = ("我的名字是","刘旭东","我今年",21,"岁了")
print("\(k.3)")
//数组
let m = [121,232,434,54]
for _ in 0...3{
    print(m)
}
print(m[0])

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)//convertedNumber为Int？类型
if (convertedNumber != nil) {//使用 if convertedNumber {会报错
    print("\(convertedNumber)")
}
else{
    print("No")
}

if let actualNumber = Int(possibleNumber){//actualNumber为Int类型
    print("\(actualNumber)")
}
else{
    print("No")
}
//隐形解析可选
let possibleString: String? = "An optional string."
print(possibleString!) // 去掉感叹号会显示Optional（An optional string.）
let assumedString: String!  = //"An implicitly unwrapped optional string."
print(assumedString)
if let asssss = assumedString{
    print(asssss)
}else{
    print("error")
}
