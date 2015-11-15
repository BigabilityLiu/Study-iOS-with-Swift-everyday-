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
        NSLog("%@", selecteProvinces)
        
        if(selecteProvinces == "安徽"){
            self.listData = self.dicData["安徽省"] as! NSArray
            self.navigationController?.title = "安徽"
            self.navigationController?.tabBarItem.badgeValue="1"
        }else if(selecteProvinces == "广东"){
            self.listData = self.dicData["广东省"] as! NSArray
            self.navigationController?.title = "广东"
            self.navigationController?.tabBarItem.badgeValue="2"
        }else{
            self.listData = self.dicData["湖南省"] as! NSArray
            self.navigationController?.title = "湖南"
            self.navigationController?.tabBarItem.badgeValue="3"
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
     }

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        diclist = self.listData[indexPath.row] as! NSDictionary
        cell.textLabel?.text = self.diclist["name"] as? String
        // Configure the cell...

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
