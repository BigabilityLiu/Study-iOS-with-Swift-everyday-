//
//  ViewController.swift
//  151031UIPickerView
//
//  Created by 刘旭东 on 15/10/31.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIPickerViewController {

    var data:NSDictionary!
    var provincesdata:NSArray!
    var citiesdata:NSArray!
    @IBOutlet weak var pickview: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBAction func clickme(sender: AnyObject) {
        let row1 = self.pickview.selectedRowInComponent(0)
        let row2 = self.pickview.selectedRowInComponent(1)
        let selected1 = self.provincesdata[row1] as! String
        let selected2 = self.citiesdata[row2] as! String
        let title = NSString(format: "%@,%@市",selected1,selected2)
        self.label.text = title as? String
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    let plist = NSBundle.mainBundle().pathForResource("provinces", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plist!)
        self.data = dict
        self.provincesdata = self.data.allKeys
        let selectedProvince = self.provincesdata[0] as! NSString
        self.citiesdata = self.data[selectedProvince] as! NSArray
        self.pickview.dataSource = self
        self.pickview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

