//
//  ViewController.swift
//  Bow Ties
//
//  Created by Pietro Rea on 7/12/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var timesWornLabel: UILabel!
  @IBOutlet weak var lastWornLabel: UILabel!
  @IBOutlet weak var favoriteLabel: UILabel!

    var managedContext:NSManagedObjectContext!
    //当前选择的领带
    var currentBowtie : Bowtie!
    //最喜欢的领带
    var favoriteBowtie : Bowtie!
    
    func insertSampleData(){
        let fetchRequest = NSFetchRequest(entityName: "Bowtie")
        fetchRequest.predicate = NSPredicate(format: "searchKey != nil", argumentArray: nil)
        let count = managedContext.countForFetchRequest(fetchRequest, error: nil)
        print("count = \(count)")
        //如果已经存在数据，则返回，如果不存在则向下运行，初始化页面数据
        if(count > 0){ return }
        print("1")
        let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!)
        for dict : AnyObject in dataArray! {
            let entity = NSEntityDescription.entityForName("Bowtie", inManagedObjectContext: managedContext)
            let bowtie = Bowtie(entity: entity!, insertIntoManagedObjectContext: managedContext)
            let btDict = dict as! NSDictionary
            
            bowtie.name = btDict["name"] as? String
            bowtie.searchKey = btDict["searchKey"] as? String
            bowtie.rating = btDict["rating"] as? NSNumber
            let tintColorDict = btDict["tintColor"] as? NSDictionary
            bowtie.tintColor = colorFromDict(tintColorDict!)//把颜色数据转换成颜色UIColor
            
            let imageName = btDict["imageName"] as? String
            let image = UIImage(named:imageName!)
            let photoData = UIImagePNGRepresentation(image!)//将图片UIImage转换成数据NSData格式
            bowtie.photoData = photoData
            bowtie.lastWorn = btDict["lastWorn"] as? NSDate
            bowtie.timesWorn = btDict["timesWorn"] as? NSNumber
            bowtie.isFavorite = btDict["isFavorite"] as? NSNumber
        }
    }
    
    func colorFromDict(dict:NSDictionary) -> UIColor{
            let red = dict["red"] as! NSNumber
            let green = dict["green"] as! NSNumber
            let blue = dict["blue"] as! NSNumber
            let color = UIColor(red: CGFloat(red)/255.0,green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
            
            return color
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    insertSampleData()
    //默认选择第一个颜色
    let selectedValue = segmentedControl.titleForSegmentAtIndex(0)
    
    let request = NSFetchRequest(entityName: "Bowtie")
    do{
        let results = try managedContext.executeFetchRequest(request) as! [Bowtie]
        favoriteBowtie = results.first
        for result in results{
            if(result.rating!.doubleValue > favoriteBowtie.rating!.doubleValue){
                favoriteBowtie = result
                favoriteBowtie.isFavorite = 1
            }else if(result.rating!.doubleValue == favoriteBowtie.rating!.doubleValue){
                result.isFavorite = 1
            }else{
                result.isFavorite = 0
            }
        }
    }catch let error as NSError{
        print("error = \(error),errorInfomation = \(error.userInfo)")
    }
    
    changeSegmentedControl(selectedValue!)

    
  }
    //把现在选择的领带的信息显示屏幕上
    func populate(bowtie:Bowtie){
        imageView.image = UIImage(data: bowtie.photoData!)
        nameLabel.text = bowtie.name
        ratingLabel.text = "评级为 : \(bowtie.rating!.doubleValue)/5"
        timesWornLabel.text = "# 已经穿了\(bowtie.timesWorn!.integerValue)次了"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        lastWornLabel.text = "最后一次穿的时间是" + dateFormatter.stringFromDate(bowtie.lastWorn!)
        favoriteLabel.hidden = !bowtie.isFavorite!.boolValue
        //设置整个视图的默认颜色
        view.tintColor = bowtie.tintColor as! UIColor
    }
  
  @IBAction func segmentedControl(control: UISegmentedControl) {
    
    let selectedValue = control.titleForSegmentAtIndex(control.selectedSegmentIndex)
    changeSegmentedControl(selectedValue!)
    
    
  }
    func changeSegmentedControl(selectedValue:String){
        let request = NSFetchRequest(entityName: "Bowtie")
        request.predicate = NSPredicate(format: "searchKey == %@", selectedValue)
        do{
            let results = try managedContext.executeFetchRequest(request) as! [Bowtie]
            currentBowtie = results.first
            print("\(currentBowtie.rating!.doubleValue)-------\(favoriteBowtie.rating!.doubleValue)")
            print(currentBowtie.isFavorite!.integerValue)
            if currentBowtie.rating!.doubleValue > favoriteBowtie.rating!.doubleValue{
                favoriteBowtie.isFavorite = 0
                currentBowtie.isFavorite = 1
                favoriteBowtie = currentBowtie
            }else if currentBowtie.rating!.doubleValue == favoriteBowtie.rating!.doubleValue{
                currentBowtie.isFavorite = 1
            }else{
                currentBowtie.isFavorite = 0
            }

            populate(results.first!)
        }catch let error as NSError{
            print("error = \(error),errorInfomation = \(error.userInfo)")
        }

    }
  
  @IBAction func wear(sender: AnyObject) {
    let times = currentBowtie.timesWorn!.integerValue
    currentBowtie.timesWorn = NSNumber(integer: (times + 1))
    currentBowtie.lastWorn = NSDate()
    do{
        try managedContext.save()
    }catch let error as NSError{
        print("error = \(error),errorInfomation = \(error.userInfo)")
    }
    
    populate(currentBowtie)
  }
  
  @IBAction func rate(sender: AnyObject) {
    let alert = UIAlertController(title: "升级", message: "升级这个领带？", preferredStyle: UIAlertControllerStyle.Alert)
    let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in
    
    }
    let saveAction = UIAlertAction(title: "确定", style: .Default) { (action:UIAlertAction) -> Void in
        let textField = alert.textFields![0] as UITextField
        self.updateRating(textField.text!)
    }
    alert.addTextFieldWithConfigurationHandler({ (textField:UITextField) -> Void in
        textField.keyboardType = .NumbersAndPunctuation
    })
    alert.addAction(cancelAction)
    alert.addAction(saveAction)
    alert.view.setNeedsLayout()
    presentViewController(alert, animated: true,completion: nil)
  }
    func updateRating(numericString:String){
        currentBowtie.rating = (numericString as NSString).doubleValue
        if currentBowtie.rating!.doubleValue > favoriteBowtie.rating!.doubleValue{
            favoriteBowtie.isFavorite = 0
            currentBowtie.isFavorite = 1
            favoriteBowtie = currentBowtie
        }else if currentBowtie.rating!.doubleValue == favoriteBowtie.rating!.doubleValue{
            currentBowtie.isFavorite = 1
        }else{
            currentBowtie.isFavorite = 0
        }

        do{
            try managedContext.save()
            populate(currentBowtie)
        }catch let error as NSError{
            print("error = \(error),errorInfomation = \(error.userInfo)")
            if error.domain == NSCocoaErrorDomain && (error.code == NSValidationNumberTooLargeError || error.code == NSValidationNumberTooSmallError){
                rate(currentBowtie)
            }
        }

    }
}

