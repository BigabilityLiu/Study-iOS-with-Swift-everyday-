//
//  TableViewController.swift
//  151031UITableView
//  输入搜索条件后会崩溃
//  Created by 刘旭东 on 15/10/31.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchBarDelegate {

    @IBOutlet weak var searBar: UISearchBar!//搜索框
    var listTeams:NSArray!//所有数据
    var listFilterTeams:NSMutableArray!//搜索后的数据
    
    override func viewDidLoad() {        
        super.viewDidLoad()
        self.searBar.delegate = self
        self.searBar.showsScopeBar = false//不显示搜索范围选项
        self.searBar.sizeToFit()
        
        let plistPath = NSBundle.mainBundle().pathForResource("ImageList", ofType: "plist")//获取ImageList.plist内的数据
        self.listTeams = NSArray(contentsOfFile: plistPath!)//把imageList.plist里面的数组读取出来
        self.filterContentForSearchText("",scope:-1)//初始化，显示所有数据

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {//窗口内节的数量
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//一个节里面，行的数量

        return listFilterTeams.count == listTeams.count ? self.listTeams.count : self.listFilterTeams.count//列表改变后返回的图片数有改变，所以得判断
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//定义tableview
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as! TableViewCell   //新定义自定义Cell要加上控制类 as! TableViewCell
        NSLog("asdadsdds")
        let row = indexPath.row
        var rowDict:NSDictionary!
        if listFilterTeams.count == listTeams.count{//如果两个内容相等，等于没有变化，读取原始的数据
            rowDict = self.listTeams[row] as! NSDictionary//读取原始数组字典里的数据
            NSLog("列表数据没有改变 %i",listFilterTeams.count)//rowDict = self.listTeams[row] as! NSDictionary//读取数组的第一个字典
        }else{
            rowDict = self.listFilterTeams[row] as! NSDictionary//读取改变后数组的数据
            NSLog("列表数据改变了 %i %i",listFilterTeams.count,listTeams.count)//rowDict = self.listFilterTeams[row] as! NSDictionary//读取数组的第一个字典
        }
        
        cell.myLabel.text = rowDict["name"] as? String//单元格内标签
        NSLog("图片名称是 %@", cell.myLabel.text!)
        cell.myImage.image = UIImage(named:rowDict["image"] as! String)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator//单元格内扩展视图的样式，此处为>

        return cell
    }
    //根据搜索框内内容搜索，
    func filterContentForSearchText(searchText:NSString,scope:Int){//scope为搜索范围
        if(searchText.length==0){//内容没有改变时候
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
            return
        }
        var tempArray:NSArray!
        if(scope == 0){//搜索范围为第一个时候
            let scopePredicte = NSPredicate(format: "self.name contains[c] %@", searchText)//搜索格式
            tempArray = self.listTeams.filteredArrayUsingPredicate(scopePredicte)
            NSLog("你选择了第一个 %i", 0)
            self.listFilterTeams = NSMutableArray(array:tempArray)
        }else if(scope == 1){
            let scopePredicte = NSPredicate(format: "self.image contains[c] %@", searchText)
            tempArray = self.listTeams.filteredArrayUsingPredicate(scopePredicte)
            self.listFilterTeams = NSMutableArray(array:tempArray)
            NSLog("你选择了第一个 %i", 1)
        }else{
            self.listFilterTeams = NSMutableArray(array: self.listTeams)
        }
    }
    //搜索框内内容开始被输入时候
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        self.searBar.showsScopeBar = true
        self.searBar.sizeToFit()
        return true
    }
    //搜索框被电击时候
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searBar.showsScopeBar = false
        self.searBar.resignFirstResponder()
        self.searBar.sizeToFit()
    }
    //搜索被取消，点击X时候
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searBar.showsScopeBar = false
        self.searBar.sizeToFit()
        self.filterContentForSearchText("", scope: -1)
        self.searBar.resignFirstResponder()
    }
    //搜索框内内容变化时候
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText, scope: self.searBar.selectedScopeButtonIndex)
        self.tableView.reloadData()
        NSLog("你选择了搜索范围时 %i", self.searBar.selectedScopeButtonIndex)
    }
    //搜索范围被改变时候
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.filterContentForSearchText(self.searBar.text!, scope: selectedScope)
        self.tableView.reloadData()
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
