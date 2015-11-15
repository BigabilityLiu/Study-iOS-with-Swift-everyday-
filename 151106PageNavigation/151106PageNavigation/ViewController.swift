//
//  ViewController.swift
//  151106PageNavigation
//  翻页效果
//  Created by 刘旭东 on 15/11/6.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

enum DirectionForward :Int{
    case Before = 1
    case After = 2
}

class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    //初始化当前页面的索引为第一页
    var pageIndex:Int = 0
    //初始化第一次翻页的方向的向后
    var directionForward = DirectionForward.After
    var pageViewController : UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置翻页时的样式和方向
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        //
        let mainStoryboard = self.storyboard!
        let page1ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("page1") as UIViewController
        let viewControllers:NSArray = [page1ViewController]
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        self.view.addSubview(self.pageViewController.view)
    }
    //向前翻页
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        pageIndex--
        if (pageIndex < 0){
            pageIndex = 0
            //return nil
        }
        directionForward = DirectionForward.Before
        
        let mainStoryboard = self.storyboard!
        let pageId = NSString(format: "page%i", pageIndex + 1)
        let pvController = mainStoryboard.instantiateViewControllerWithIdentifier(pageId as String) as UIViewController
        return pvController
    }
    //向后翻页
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        pageIndex++
        if pageIndex > 2{
            pageIndex = 2
            return nil
        }
        directionForward = DirectionForward.After
        
        let mainStoryboard = self.storyboard!
        let pageId = NSString(format: "page%i", pageIndex + 1)
        let pvController = mainStoryboard.instantiateViewControllerWithIdentifier(pageId as String) as UIViewController
        return pvController
    }
    //设置是否显示以及书脊的位置
    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        self.pageViewController.doubleSided = false
        return .Min
    }
    //判断翻页动作是否执行成功
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed == false){
            if(directionForward == DirectionForward.After){
                pageIndex--  //向后翻页失败，页数－1
            }
            if(directionForward == DirectionForward.Before){
                pageIndex++  //向前翻页失败，页数+1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

