//
//  ViewController.swift
//  1024
//  函数和闭包
//  Created by 刘旭东 on 15/10/24.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //
    func greet(name:String,day:String)->String{
        return "Hello \(name),today is \(day)"
    }
    //将一个Int类型的数组返回为两个Int数值
    func sumof(numbers:Array<Int>)->(Int,Int){
        var nums = 0;
        var i = 0;
        for number in numbers{
            nums += number
            i++;
        }
        return (nums,i)//前面是总和，后面是数组长度
    }
    //函数也可以使用另一个函数作为参数
    func hasAntMatches(list:Array<Int>,condition:Int->Bool)->Bool{
        for item in list{
            if condition(item){
                return true//list中有一个数满足条件，即可返回true
            }
        }
        return false//list中没有一个数满足条件返回false
    }
    //函数值小于10返回true，大于等于10返回false
    func lessThanTen(number:Int)->Bool{
        return number<10
    }
    //label显示函数的结果
    @IBOutlet weak var label1: UILabel!
    //显示函数greet的结果
    @IBAction func button1(sender: AnyObject) {
        self.label1.text=greet("刘旭东",day: "星期天")
    }
    //显示函数sumof的结果
    @IBAction func button2(sender: AnyObject) {
        let  array=[12,123,21,23]
        let (x,y)=sumof(array)//x和y分别取得函数返回的两个数值
        self.label1.text = (String)(x/y)
        print("\(array.count)")//.count函数可以直接取得数组的长度
    }
    @IBAction func button3(sender: AnyObject) {
        let array = [23,12,34,13]
        let flag = hasAntMatches(array, condition: lessThanTen)
        self.label1.text = String(flag)
    }
    
    
    
    


}

