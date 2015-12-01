//
//  ViewController.swift
//  UITextField
//
//  Created by 刘旭东 on 15/11/18.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    
    
    

    override func viewDidLoad() {

        //设置委托，不设置的话不能执行下面的方法
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        
        let textField1 = UITextField(frame: CGRectMake(20,20,350,40))//初始化
        self.view.addSubview(textField1)//将textField1添加到视图中
        textField1.text = "这个textField时通过代码创建的"//设置显示文本
        textField1.background = UIImage(named: "4.png")//添加背景图片
        //设置文本的字体大小粗细及颜色
        textField1.font = UIFont.systemFontOfSize(12, weight: 2)//使用系统默认字体
        textField1.font = UIFont(name: "HelveticaNeue-Bold", size: 18)//指定字体指定字号
        textField1.textColor = UIColor.redColor()
        textField1.enabled = false//设置文本框是否可用，默认是true
        //设置文本框删除效果
        textField1.clearButtonMode = .WhileEditing//.Always.Never
        
        //设置富文本，即隐形在文本框后的字
        let attributeStr:NSMutableAttributedString = NSMutableAttributedString(string: "这是一个无边框含富文本的文本框")
        //设置富文本0到5个字符字体HelveticaNeue-Bold 12号字体,NSMakeRange(0,4)是指从第0个字符开始，往后四个字符，即“这是一个”这四个字
        attributeStr.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 12)!, range: NSMakeRange(0,4))
        //设置富文本的字体，NSMakeRange(4,3)是指从第4个字符开始，往后3个字符，即“富文本”这三个字
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(4,3))
        //设置富文本背景颜色
        attributeStr.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellowColor(), range: NSMakeRange(0, 4))
        textField2.attributedPlaceholder = attributeStr
        //设置字体对齐方向和文本框样式
        textField2.textAlignment = .Right
        textField2.borderStyle = .None
        super.viewDidLoad()
        
        //设置占位字符，和富文本类似
        textField3.placeholder = "👉通过代码添加的右视图"
        //设置文本框最小字体
        textField3.minimumFontSize = 12
        //开始输入时清空文本框原有内容
        textField3.clearsOnBeginEditing = true
        //创建右视图
        let rightView = UIView(frame: CGRectMake(320,0,50,40))
        rightView.backgroundColor = UIColor.blueColor()
        textField3.addSubview(rightView)
        //设置右视图显示类型
        textField3.rightViewMode = .WhileEditing//所有字母都大些//.Never//.UnlessEditing开始编辑时显示//Sentences句子首字母大写
        //首字母是否大写
        textField3.autocapitalizationType = .AllCharacters//.Words首字母大写
       
        textField4.keyboardAppearance = .Default//设置本文本框弹出的键盘样式 .Default .Light  .Dark
        textField4.returnKeyType = .Join//设置键盘的enter按钮的样式
        textField5.backgroundColor = UIColor.brownColor()//设置背景色
        textField5.text = "这个文本框在键盘出现时回上移，不会被键盘遮挡住"
        
        //UITextField类的头文件自动穿件了下面三个通知内心
        //let UITextFieldTextDidBeginEditingNotification:NSString!
        //let UITextFieldTextDidEndEditingNotification:NSString!
        //let UITextFieldTextDidChangeNotification:NSString!
        //创建了三个监听，接收到通知时发生对应的事件
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidBeginEditing", name: "UITextFieldTextDidBeginEditingNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidEndEditing", name: "UITextFieldTextDidEndEditingNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange", name: "UITextFieldTextDidChangeNotification", object: nil)
       
    }
    
    //接收到监听时发生的事件
    func textDidBeginEditing(){
        print("=============textDidBeginEditing")
    }
    func textDidEndEditing(){
        print("=============textDidEndEditing")
    }
    func textDidChange(){
        print("=============textDidChange")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        NSLog("文本框内容改变时执行，能得到改变的坐标和改变的方法")
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        NSLog("文本框结束编辑时执行")
    }
    //文本框开始编辑之前
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        NSLog("文本框将开始编辑时")
        let offset:CGFloat = self.view.frame.height - (textField.frame.origin.y + textField.frame.height + 216 + 60)//如果textfield的y坐标和高度加上键盘的高度大于视图高度的话
        NSLog("\(offset)")
        if offset<=0{
            UIView.animateWithDuration(0.3, animations: {
                var frame:CGRect = self.view.frame
                frame.origin.y = offset
                self.view.frame = frame//使整个视图向上移动
            })
        }
        return true//如果返回false文本框将不能被编辑
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        NSLog("文本框开始编辑")
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        NSLog("文本框被清除")
        return true
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        NSLog("文本框将结束编辑")
        return true//如果时false，表示编辑结束之后，文本框不可再编辑
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NSLog("按键盘换行键时执行，一般用于回收键盘或者提交数据等操作")
        UIView.animateWithDuration(0.3, animations: {
            var frame:CGRect = self.view.frame
            frame.origin.y = 0.0
            self.view.frame = frame
            
        })
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        textField5.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

