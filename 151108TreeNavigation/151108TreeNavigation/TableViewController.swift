//
//  TableViewController.swift
//  151108TreeNavigation
//
//  Created by 刘旭东 on 15/11/8.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var dicData:NSDictionary!
    var listData:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let plistPath = NSBundle.mainBundle().pathForResource("provinces", ofType: "plist")
        self.dicData = NSDictionary(contentsOfFile: plistPath!)
        self.listData = self.dicData.allKeys as NSArray!
        self.title = "省份信息"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = self.listData[indexPath.row] as? String
        
        // Configure the cell...

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowSelectedProvince"){
            let citiesViewController = segue.destinationViewController as! CitiesViewController
            let indexPath = self.tableView.indexPathForSelectedRow as NSIndexPath?
            let selectedIndex = indexPath!.row
            
            let selectName = self.listData[selectedIndex] as! NSString 
            citiesViewController.listData = self.dicData[selectName] as! NSArray
            NSLog("\(citiesViewController.listData.count)")
            citiesViewController.title = selectName as String
            
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
