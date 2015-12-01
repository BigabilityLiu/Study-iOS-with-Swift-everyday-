//
//  ViewController.swift
//  151106PageControlNavigation
//
//  Created by 刘旭东 on 15/11/6.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var page1:UIView!
    var page2:UIView!
    var page3:UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBAction func changePage(sender: AnyObject) {
        //设置切换图片是所需要的时间
        UIView.animateWithDuration(2, animations: {
            let whichPage = self.pageControl.currentPage//当前页数
            self.scrollView.contentOffset = CGPointMake(320 * CGFloat(whichPage), 0)//切换时，转换到此位置
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置scrollView的委托对象为当前视图控制器
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height)//设置可滑动区域的宽高
        self.scrollView.frame = self.view.frame
        let mainStoryboard = self.storyboard!
        //通过StoryBoard ID从故事板对象取出视图控制器
        let page1ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page1") as UIViewController//读取ID为page1的页面到控制器中
        self.page1 = page1ViewController.view
        self.page1.frame = CGRectMake(0.0, 0.0,320.0,548.0)//设置此页面的 x坐标y坐标 宽 高
        
        let page2ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page2") as UIViewController
        self.page2 = page2ViewController.view
        self.page2.frame = CGRectMake(320.0, 0.0,320.0,548.0)
        
        let page3ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page3") as UIViewController
        self.page3 = page3ViewController.view
        self.page3.frame = CGRectMake(320.0 * 2, 0.0,320.0,548.0)
        
        self.scrollView.addSubview(page1)
        self.scrollView.addSubview(page2)
        self.scrollView.addSubview(page3)

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset//读取现在scrollview的移动值
        self.pageControl.currentPage = Int(offset.x)/320//通过移动了的值判断当前页面是哪个页面
    }


}

