//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementByTen()
incrementByTen()