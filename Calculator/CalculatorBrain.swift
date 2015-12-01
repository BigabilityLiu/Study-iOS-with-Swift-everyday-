//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 刘旭东 on 15/11/16.
//  Copyright © 2015年 刘旭东. All rights reserved.
//

import Foundation

class CalculatorBrain
{   //栈储存的三种类型数据
    private enum Op{
        case Operand(Double)//数据类型
        case UnaryOperation(String,Double ->Double)//将运算符和运算数放入，开平方函数
        case Binaryperation(String,(Double,Double) ->Double)//两个运算数和一个运算符
    }
    //栈
    private var opStack = [Op]()
    //字典，放入运算符和对应的方法
    private var knownOps = [String:Op]()
    //初始化字典，放入两个参数，第一个参数是运算符string，第二个是运算函数
    init (){
        knownOps["+"] = Op.Binaryperation("+",+)
        knownOps["−"] = Op.Binaryperation("−"){$1 - $0}
        knownOps["×"] = Op.Binaryperation("×",*)
        knownOps["÷"] = Op.Binaryperation("÷"){$1 / $0}
        knownOps["％"] = Op.Binaryperation("％"){$1 % $0}
        knownOps["√"] = Op.UnaryOperation("√",sqrt)
        
    }
    //元组，参数为栈，第一个返回值为计算结果，第二个返回值为剩下的栈
    private func evaluate(ops:[Op]) -> (result: Double?,remainingOps: [Op]){
        if !ops.isEmpty{//如果栈时空，返回(nil,ops)
            var remainingOps = ops//运算后剩下的栈
            let op = remainingOps.removeLast()//取出栈最上面的数据
            switch op{
            case .Operand(let operand)://如果取出的是数字
                return (operand,remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result{
                    return (operation(operand),operandEvaluation.remainingOps)
                }
            case .Binaryperation(_, let operation)://operation取到运算方法
                let operand1Evaluation = evaluate(remainingOps)//第一次递归返回的（result，remainingOps）
                if let operand1 = operand1Evaluation.result{//取到最后输入的数
                    let oprand2Evaluation = evaluate(operand1Evaluation.remainingOps)
                    if let operand2 = oprand2Evaluation.result{//取到倒数第二个输入的数
                        return (operation(operand1,operand2),oprand2Evaluation.remainingOps)
                    }
                }
            }
        
        }
        return (nil,ops)
    }
    //返回值为Optional（Double），是因为有的时候可以返回文字，比如还没有输入数字就输入了运算符的时候，提示没有数字
    func evaluate()->Double?{
        let (result,_) = evaluate(opStack)
        return result
    }
    //当放入数字时
    func pushOperand(operand:Double)->Double?{
        opStack.append(Op.Operand(operand))
        return 	evaluate()//返回栈最上面的数，也就是刚才输入的数

    }
    //当放入运算符时
    func performOperation(Symbol:String)-> Double?{
        if let operation = knownOps[Symbol]{
            opStack.append(operation)//将运算符放入栈
        }
        return evaluate()//返回计算结果
    }
}
