//
//  ViewController.swift
//  151028-UIDatePicker
//
//  Created by 刘旭东 on 15/10/28.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var label: UILabel!

    @IBAction func button(sender: AnyObject) {
        var date1 = self.datePicker.date
        let desc = date1.descriptionWithLocale(NSLocale.currentLocale())
        NSLog("%@", desc)//Wednesday, October 28, 2015 at 11:02:53 PM China Standard Time
        
        let dateformatter:NSDateFormatter = NSDateFormatter()
        dateformatter.dateFormat = "MM-dd-YY hh:mm"
        self.label.text = dateformatter.stringFromDate(date1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

