//
//  ViewController.swift
//  Calculator
//
//  Created by 刘旭东 on 15/11/15.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber = false
    var opperandStack:Array<Double> = []//或者 =Array<Double>()
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }

    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        opperandStack.append(displayValue)
        print("operandStack = \(opperandStack)")
    }
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation{
        case "＋":performOperation {$0 + $1}
        case "−":performOperation  {$1 - $0}
        case "×":performOperation {$0 * $1}
        case "÷":performOperation {$1 / $0}
        case "√":performOperation2{sqrt($0)}
        default:break
        }
    }
    func performOperation(operation:(Double,Double)->Double){
        if opperandStack.count >= 2{
            displayValue = operation(opperandStack.removeLast(),opperandStack.removeLast())
            enter()
        }
    }
    func performOperation2(operation: Double -> Double){
        if opperandStack.count >= 1{
            displayValue = operation(opperandStack.removeLast())
            enter()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

