//
//  ViewController.swift
//  151029－UICollectionView
//
//  Created by 刘旭东 on 15/10/29.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var events:[[String:String]] = [
        ["name":"1","pic":"1.jpg"],
        ["name":"2","pic":"2.png"],
        ["name":"3","pic":"3.jpg"],
        ["name":"4","pic":"4.jpg"],
        ["name":"5","pic":"5.jpg"],
        ["name":"6","pic":"6.jpg"],
        ["name":"7","pic":"7.png"],
        ["name":"8","pic":"8.jpg"]
    ]

    //var dataMarr:NSMutableArray = []
//    func setUpCollection(){
//        for index in 0..<8{
//            let image:UIImage = UIImage(named: NSString(format: "%ld", index+1) as String)!
//            let title:String = NSString(format: "{0,%ld}", index+1) as String
//            let dic:Dictionary = ["image":image,"title":title]
//            dataMarr.addObject(dic)
//        }
//        
//    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 4//有四个节，循环四次
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2//每个节有两个单元格
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Cell
        cell.label.text = events[0]["name"]
        cell.imageView.image = UIImage(named:events[0]["pic"]!)
        NSLog("%i %@", 0,events[0]["name"]!)//输出文件名
        let event = events.removeAtIndex(0)//移除第一个元素
        events.append(event)//将被移除的元素放到最后
        NSLog("%i", events.count)
//        cell.imageView.image = self.dataMarr[index]["image"] as? UIImage//image
//        cell.label.text = self.dataMarr[index]["title"] as? String //title
        //}
        return cell
    }
    override func collectionView(collectionView:UICollectionView,didSelectItemAtIndexPath indexPath:NSIndexPath){
        NSLog("selected event name: %@ ", events[indexPath.row]["name"]! as String)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

