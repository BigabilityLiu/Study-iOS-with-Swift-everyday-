//
//  main.swift
//  151027
//  控制流程
//  Created by 刘旭东 on 15/10/27.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import Foundation

let base = 3
let power = 10
var answer = 1
for _ in 2...power{
    answer *= base
   // print("\(answer)")
}
print("\(base) to power of \(power) is \(answer)")//3的10次方
//遍历数组
let names = ["刘","能"]
for name in names{
    print("Hello \(name)")
}
//遍历字典
let books = ["iOS":"苹果","android":"安卓","html":"网页"]
for (缩写,名字) in books{
    print("\(缩写) 的中文是 \(名字)")
}

let a:Character = "a"
switch a{
case "a","A":print("This is A")//可以包含多个模式
    fallthrough//继续往下执行
default: print("sada")
}
var i = 10
alebel : while i > 0{
    --i
    print("\(i)")
    continue alebel
}

