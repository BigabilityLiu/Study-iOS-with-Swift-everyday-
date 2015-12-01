//
//  DetailViewController.swift
//  151108TreeNavigation
//
//  Created by 刘旭东 on 15/11/8.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {
    var cityName:NSString!
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("\(cityName)")
        let url = NSURL(string:"http://m.baidu.com")
        let request = NSURLRequest(URL:url!)
        self.webview.loadRequest(request)
        self.webview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func webViewDidFinishLoad(webview:UIWebView){
        NSLog("finish")
        NSLog("%@", webview.stringByEvaluatingJavaScriptFromString("document.body.innerHTML")!)
    }
    func webView(webview:UIWebView ,didFailLoadWithError error:NSError?){
        NSLog("error: %@", error!)
    }

}
