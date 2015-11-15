//
//  RegisterViewController.swift
//  151102UITableViewStaticCells
//
//  Created by 刘旭东 on 15/11/5.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    
    @IBAction func save(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            NSLog("你点击了Save按钮")
            var dataDict = NSDictionary(object: self.txtUserName.text!, forKey: "username")
            //通过通知机制将帐号框里的数据返回到登录界面
            NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: dataDict as [NSObject : AnyObject])
            
            
        })
    }
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            NSLog("你点击了cancel按钮")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("register")
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
