//
//  ViewController.swift
//  151109委托模式
//
//  Created by 刘旭东 on 15/11/9.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        NSLog("textFieldShouldBeginEditing")
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        NSLog("textFieldDidBeginEditing")
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        NSLog("textFieldShouldEndEditing")
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        NSLog("textFieldDidEndEditing")
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NSLog("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}

