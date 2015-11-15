//: Playground - noun: a place where people can play
//协议和扩展

import Cocoa
//使用protocol声明一个接口
protocol ExampleProtocol{
    var simpleDescription:String {get}
    mutating func adjust()
}
//使用类实现接口
class SimpleClass: ExampleProtocol {
    var simpleDescription :String = "A very simple class"
    var anotherProperty:Int = 69105
    //不需要mutating关键字标记，因为类中的方法经常会修改类
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
    
}
//使用结构体实现接口
struct SimpleStructure:ExampleProtocol {
    var simpleDescription:String = "A simple structure"
    //使用mutating标记一个会修改结构体的方法
    mutating func adjust() {
        simpleDescription += "(adjusted)"
        
    }
}

var a = SimpleClass()
var b = SimpleStructure()
a.adjust()
let aDescription = a.simpleDescription
b.adjust()
let bDescription = b.simpleDescription
//创建一个有不同类型但是都实现同一个接口的对象集合
let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//即使 protocolValue 变量在运行时的类型是 simpleClass，但是编译器会把它当做 ExampleProtocol 类型。这表示你不能调用实现此接口的类中的自有的方法或者属性。