//
//  Calculator.swift
//  calculator
//
//  Created by James Baldwin on 8/5/21.
//

import Foundation

struct Calculator {
    func calculate(selectedOperator: String, nums: [Double]) -> String {
        var finalVal = ""
        switch selectedOperator {
        case "+":
            finalVal = addition(numbersArray: nums)
        case "-":
            finalVal = subtraction(numbersArray: nums)
        case "x":
            finalVal = multiply(numbersArray: nums)
        case "/":
            finalVal = divide(numbersArray: nums)
        case "%":
            finalVal = modulo(numbersArray: nums)
        default:
            print("Error")
        }
        
        return finalVal
    }
    
    func addition(numbersArray: [Double]) -> String {
        var tempVal = 0.0
        for num in numbersArray {
            tempVal = tempVal + num
        }
        return String(tempVal)
    }
    
    func subtraction(numbersArray: [Double]) -> String {
        var tempVal = 0.0
        for num in numbersArray {
            if tempVal == 0.0 {
                tempVal = num
            } else {
                tempVal = tempVal - num
            }
        }
        return String(tempVal)
    }
    
    func multiply(numbersArray: [Double]) -> String {
        var tempVal = 0.0
        for num in numbersArray {
            if tempVal == 0.0 {
                tempVal = num
            } else {
                tempVal = tempVal * num
            }
        }
        return String(tempVal)
    }
    
    func divide(numbersArray: [Double]) -> String {
        var tempVal = 0.0
        for num in numbersArray {
            if tempVal == 0.0 {
                tempVal = num
            } else {
                tempVal = tempVal / num
            }
        }
        return String(tempVal)
    }
    
    func modulo(numbersArray: [Double]) -> String {
        var tempVal = 0.0
        for num in numbersArray {
            if tempVal == 0.0 {
                tempVal = num
            } else {
                tempVal.formTruncatingRemainder(dividingBy: num)
            }
        }
        return String(tempVal)
    }
    
    func getValue(btn: BorderButton) -> String {
        let num = btn.currentTitle!
        return num
    }
    
    func getOperator(btn: BorderButton, numbersArray: [Double]) -> String {
        let op = btn.currentTitle!
        return op
    }
    
}
