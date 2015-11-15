//
//  TableViewController.swift
//  151102-UIRefreshControl
//
//  Created by 刘旭东 on 15/11/2.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var logs:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logs = NSMutableArray()
        var date = NSDate()
        self.logs.addObject(date)
        
        var rc = UIRefreshControl()
        rc.attributedTitle = NSAttributedString(string: "⬇️拉就可以刷新哟")
        rc.addTarget(self, action: "refreshTableView", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = rc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
          }
    
    func refreshTableView(){
        if(self.refreshControl?.refreshing == true){
            self.refreshControl?.attributedTitle = NSAttributedString(string: "少主我在刷新中")
        }
        var date = NSDate()
        self.logs.addObject(date)
        self.refreshControl?.endRefreshing()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "少主我刷新完嘞")
        self.tableView.reloadData()
    }
  

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.logs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        var formatter = NSDateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd hh:mm:ss zzz"
        cell.textLabel?.text = formatter.stringFromDate(self.logs[indexPath.row] as! NSDate)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
