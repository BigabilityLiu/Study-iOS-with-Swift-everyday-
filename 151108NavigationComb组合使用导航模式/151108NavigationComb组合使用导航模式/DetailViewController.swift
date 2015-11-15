//
//  DetailViewController.swift
//  151108NavigationComb组合使用导航模式
//
//  Created by 刘旭东 on 15/11/8.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {
    
    var url:NSString!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("已进入")
        let url = NSURL(string: self.url as String)
        let request = NSURLRequest(URL: url!)
        NSLog("网址是 %@", url!)
        self.webView.delegate = self
        self.webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(webView: UIWebView) {
        NSLog("start")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("finish")
    }
    
    func webView(webView: UIWebView,didfailLoadWithError error:NSError){
        NSLog("error %@", error)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
