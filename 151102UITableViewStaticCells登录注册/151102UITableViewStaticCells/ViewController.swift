//
//  ViewController.swift
//  151102UITableViewStaticCells
//
//  Created by 刘旭东 on 15/11/2.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //注册通知RegisterCompletionNotification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "registerCompletion:", name: "RegisterCompletionNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleEnterBackground:", name: UIApplicationDidEnterBackgroundNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleEnterBackground:", name: UIApplicationWillEnterForegroundNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //注册回调方法registerCompletion
    func registerCompletion(notification:NSNotification){
        let theData:NSDictionary = notification.userInfo!
        let username = theData.objectForKey("username") as! NSString
        NSLog("username = %@", username)
    }

}

