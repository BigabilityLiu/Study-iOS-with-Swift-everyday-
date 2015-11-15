//: Playground - noun: a place where people can play
//泛型

import Cocoa
//在尖括号(< >)中写一个名字来创建一个泛型函数或者类型
func repreat<ItemType>(item:ItemType,times:Int) -> [ItemType]{
    var result = [ItemType]()
    for _ in 0..<times{
        result += [item]
    }
    return result
}

repreat("knock", times: 4)

//可以创建函数和方法的通用形式，以及类、枚举、结构。
enum OptionalValue<T>{
    case None
    case Some(T)
}
var possibleInteger:OptionalValue<Int> = .None
possibleInteger = .Some(100)


