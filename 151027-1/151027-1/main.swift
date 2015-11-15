//
//  main.swift
//  151027-1
//  函数
//  Created by 刘旭东 on 15/10/27.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import Foundation

func sayHello(name:String)->String{
    return "Hello \(name) 😁"
}
print(sayHello("李有鹏"))
//外部参数，使用默认参数
func join(第一句话 s1:String,第二个句话 s2:String,是 joiner:String = "是")->String{
    return s1 + joiner + s2
}
var s = join( 第一句话: "刘大本事",  第二个句话: "真有本事")
print("\(s)")

func join1(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

s = join1("hello", s2: "world", joiner: "-")
//使用...定义可变参数，表示多个
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
s = String(arithmeticMean(1, 2, 3, 4, 5))
print("\(s)")
s = String(arithmeticMean(3, 8, 19))
print("\(s)")
//输入输出函数
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, b: &anotherInt)
print("\(someInt) + \(anotherInt)")
//函数类型作为参数
func useswap(mathFunction:(String,String,String)->String,a:String,b:String,c:String)->String{
    return mathFunction(a, b, "---")
}
s = useswap(join1, a: "111", b: "222",c:"+++")
print("\(s)")
//函数作为返回值
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
//函数 chooseStepFunction ，它的返回值类型是 (Int) -> Int 的函数类型。chooseStepFunction 根据布尔值 backwards 的真假返回 stepForward 函数或 stepBackward 函数
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print("Counting to zero:")
// Counting to zero
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero")