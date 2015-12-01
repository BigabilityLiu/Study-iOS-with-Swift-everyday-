//
//  TableViewController.swift
//  151108NavigationComb组合使用导航模式
//
//  Created by 刘旭东 on 15/11/8.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dicData:NSDictionary!
    var listData:NSArray!
    var diclist:NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()

        let plistPath = NSBundle.mainBundle().pathForResource("provincesWithHTTP", ofType: "plist")
        self.dicData = NSDictionary(contentsOfFile: plistPath!)
        let navigationController = self.parentViewController as! UINavigationController
        let selecteProvinces = navigationController.tabBarItem.title!
        
        if(selecteProvinces == "安徽"){
            NSLog("选中的itembar的tag是%@", selecteProvinces)
            self.listData = self.dicData["安徽省"] as! NSArray
            self.navigationController?.title = "安徽"
            self.navigationController?.tabBarItem.badgeValue = "\(self.listData.count)"
            self.navigationController?.tabBarItem.selectedImage = UIImage(named: "1.png")!.imageWithRenderingMode(.AlwaysOriginal)
            //UITabBar.appearance().barTintColor = UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0 )
            // MARK: 设置 tabbar 子视图选中后的颜色
            //UITabBar.appearance().tintColor = UIColor ( red: 0.1882, green: 1.0, blue: 0.7785, alpha: 1.0 )
        }else if(selecteProvinces == "广东"){
            NSLog("选中的itembar的tag是%@", selecteProvinces)
            self.listData = self.dicData["广东省"] as! NSArray
            self.navigationController?.title = "广东"
            self.navigationController?.tabBarItem.badgeValue = "\(self.listData.count)"
            self.navigationController?.tabBarItem.selectedImage = UIImage(named: "2.png")!.imageWithRenderingMode(.AlwaysOriginal)
        }else{
            NSLog("选中的itembar的tag是%@", selecteProvinces)
            self.listData = self.dicData["湖南省"] as! NSArray
            self.navigationController?.title = "湖南"
            self.navigationController?.tabBarItem.badgeValue = "\(self.listData.count)"
            self.navigationController?.tabBarItem.selectedImage = UIImage(named: "3.png")!.imageWithRenderingMode(.AlwaysOriginal)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
     }

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        diclist = self.listData[indexPath.row] as! NSDictionary
        cell.textLabel?.text = self.diclist["name"] as? String

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetail"){
            let detailViewController = segue.destinationViewController as! DetailViewController
            let seletedIndex = self.tableView.indexPathForSelectedRow?.row
            diclist = self.listData[seletedIndex!] as! NSDictionary
            detailViewController.title = self.diclist["name"] as? String
            detailViewController.url = self.diclist["url"] as! String
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

}
