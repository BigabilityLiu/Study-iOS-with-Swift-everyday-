//
//  TableViewController.swift
//  151103UITableView-NavigationControllwe
//
//  Created by 刘旭东 on 15/11/3.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UITextFieldDelegate {
   
    @IBOutlet var txtField: UITextField!
    var listTeams:NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = "单元格的删除增加和移动"
        //设置单元格文本框
        self.txtField.hidden = true//初次加载时候不显示
        self.txtField.delegate = self
        self.listTeams = NSMutableArray(array: ["安徽","广东","江苏","湖南"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count + 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        let b_addCell = (indexPath.row == self.listTeams.count)
        
        if(b_addCell == false){
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator//扩展视图效果
            cell.textLabel?.text = self.listTeams[indexPath.row] as? String
        }else{
            self.txtField.frame = CGRectMake(20, 5, 300, 44)//增加的txtfield的坐标以及宽和高
            self.txtField.borderStyle = UITextBorderStyle.RoundedRect//怎么加的txtfield的边框样式
            self.txtField.placeholder = "增加！"//隐形提示字
            self.txtField.text = ""
            cell.contentView.addSubview(self.txtField)//单元格增加一个txtfiled
        }

        return cell
    }
    //UIViewController的生命周期方法，用于响应视图编辑状态的变化
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing,animated: animated)
        if editing{//当点击编辑🔘，表视图将处于编辑状态
            self.txtField.hidden = false//不隐藏
        }else
        {
            self.txtField.hidden = true//隐藏
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //单元格编辑图标的设定
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        NSLog("\(indexPath.row)------\(self.listTeams.count)")
        if(indexPath.row == self.listTeams.count){
            return UITableViewCellEditingStyle.Insert//视图中新增加的单元格呈添加样式
        }else{
            return UITableViewCellEditingStyle.Delete//视图中原来的单元格呈删除样式
        }
        //return UITableViewCellEditingStyle.None//使用移动单元格时使用,如果使用这条语句则要把上面注释掉，不使用这条语句的话删除增加样式会和移动样式共存
    }
    //实现删除或者插入的处理
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let indexPaths = NSArray(array: [indexPath])
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            self.listTeams.removeObjectAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths(indexPaths as! [NSIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)//动画效果
        }else if(editingStyle == UITableViewCellEditingStyle.Insert){
            self.listTeams.insertObject(self.txtField.text!, atIndex: self.listTeams.count)
            self.tableView.insertRowsAtIndexPaths(indexPaths as! [NSIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        self.tableView.reloadData()
    }
    //但最后一行被选中时高亮效果
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.row == self.listTeams.count){
            return false
        }else {
            return true
        }
    }
    //单元格的高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    //移动单元格时使用,返回是否可以移动
    override func tableView(tableview:UITableView ,canMoveRowAtIndexPath indexPath:NSIndexPath )->Bool{
        return true//不可以移动则返回false
    }
    //移动单元格时，等于listTeams重新排列
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let stringToMove = self.listTeams[sourceIndexPath.row] as! String
        self.listTeams.removeObjectAtIndex(sourceIndexPath.row)
        self.listTeams.insertObject(stringToMove, atIndex: destinationIndexPath.row)
    }

}
