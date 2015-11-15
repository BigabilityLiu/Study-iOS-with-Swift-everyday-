//
//  main.swift
//  151026
//集合类型
//  Created by 刘旭东 on 15/10/26.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import Foundation

print("Hello, World!")
//两种定义字符串数组的方式
var shoppingList:[String] = ["eggs","milk"]//shoppingList:String[]方式已经被舍弃
var list:Array<String> = ["android","iOS"]
//.cont获取数组中元素的数量
print("list 数组有\(list.count) 个字符串")
//.isEmpty判断数组是否为空
if shoppingList.isEmpty {
    print("Empty")
}else{
    print("NotEmpty")
}
//添加数组
list.append("HTML")
list  += ["CSS"]// 写成 list += "css"形式会报错，因为“css”是字符串而不是数组
print("\(list)")

print("\(list[0])")
//替换数组元素
list[1..<3]=["Jquery","Java"]
print("\(list)")
//使用数组的 insert (atIndex:) 方法在 atIndex 之前添加元素
list.insert("PHP", atIndex: 3)
print("\(list)")
//使用 removeAtIndex 方法来移除数组中的某一项。这个方法把数组在索引位置存储的元素移除，并返回这个被移除的元素
let list1 = list.removeAtIndex(3) + list.removeAtIndex(3)
print("\(list1)")
print("\(list)")
list.removeLast()
print("\(list)")
//遍历数组;
for (item,value) in list.enumerate(){
    print("\(item) : \(value)")
}

//字典
var books:Dictionary<Int,String> = [1:"西游记",
    2:"三国演义",
    3:"红楼梦",
    4:"水浒传",
]
print("\(books.count)")
print("\(books[3])")//输出Optional("红楼梦")，如果定义时候Dictionary<Int,String !>输出Optional(红楼梦)
//改变对应值
books[1] = "圣经"
print("\(books)")
//updateValue(forKey:) 方法在 forKey 不存在对应值的时候增加值，存在的时候更新对应已存在的值。这个方法返回更新值之前的原值。以方便我们检查更新是否成功。
let oldbooks = books.updateValue("哈利波特", forKey: 1)
print("\(books)")
print("\(oldbooks)")
print("\(books[1])")
//removeValueForKey 方法也可以用来从字典中移除键值对。如果键值对存在，移除该键值对并且返回被移除的 value；否则返回 nil
let removebooks = books.removeValueForKey(1)
print("\(books)")
print("\(removebooks)")
//创建空字典
var nilDic = Dictionary<Int,String>()
print("\(nilDic)")
nilDic[12]="onetwo"
print("\(nilDic)")//[12: "onetwo"]
nilDic=[:]
print("\(nilDic)")//[:]
























