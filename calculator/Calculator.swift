//
//  Calculator.swift
//  calculator
//
//  Created by Rey Matsunaga on 1/22/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

import Foundation

class Calculator
{
    var buttons = [CalcButton]()
    var operation: String? = nil
    var numberOne: Double? = nil
    var numberTwo: Double? = nil
    var result: Double? = nil
    var decimal: Bool = false
    var decimalDivider: Double = 10
    
    init() {
        let buttonTitles = ["AC", "+/-", "%", "/", "7", "8", "9", "*", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]
        for index in 0...buttonTitles.count - 1 {
            buttons.append(CalcButton.init(buttonTitles[index]))
        }
    }
    
    func calculate() {
        if(operation == "/") {
            result = numberOne! / numberTwo!
            numberOne = result!
            numberTwo = nil
            operation = nil
            decimal = false
            decimalDivider = 10
        } else if(operation == "*") {
            result = numberOne! * numberTwo!
            numberOne = result!
            numberTwo = nil
            operation = nil
            decimal = false
            decimalDivider = 10
        } else if(operation == "-") {
            result = numberOne! - numberTwo!
            numberOne = result!
            numberTwo = nil
            operation = nil
            decimal = false
            decimalDivider = 10
        } else {
            result = numberOne! + numberTwo!
            numberOne = result!
            numberTwo = nil
            operation = nil
            decimal = false
            decimalDivider = 10
        }
    }
    
    func chooseButton(at index: String) {
        // find button
        for button in buttons {
            if(index == button.identifier) {
                // You have found the button
                
                // Is button clicked a number?
                if(!button.isOperator) {
                    if(numberOne == nil) {
                        if(!decimal) {
                            numberOne = Double(button.identifier)!
                        } else {
                            numberOne = Double(button.identifier)! / decimalDivider
                            decimalDivider *= 10
                        }
                        
                    } else if(numberOne != nil && operation == nil) {
                        if(!decimal) {
                            numberOne = numberOne! * 10 + Double(button.identifier)!
                        } else {
                            numberOne = numberOne! + Double(button.identifier)! / decimalDivider
                            decimalDivider *= 10
                        }
                        
                    } else if(numberOne != nil && operation != nil) {
                        if(numberTwo == nil) {
                            if(!decimal) {
                                numberTwo = Double(button.identifier)!
                            } else {
                                numberTwo = Double(button.identifier)! / decimalDivider
                                decimalDivider *= 10
                            }
                            
                        } else {
                            if(!decimal) {
                                numberTwo = numberTwo! * 10 + Double(button.identifier)!
                            } else {
                                numberTwo = numberTwo! * 10 + Double(button.identifier)! / decimalDivider
                                decimalDivider *= 10
                            }
                            
                        }
                    }
                } else {
                // button is either an operator or modifier or =
                    decimalDivider = 10
                    decimal = false
                    switch button.identifier {
                    case "AC":
                        numberOne = nil
                        numberTwo = nil
                        operation = nil
                        result = nil
                    case "+/-":
                        if(numberOne != nil) {
                            numberOne! *= -1
                        } else if(numberTwo == nil) {
                            numberOne! *= -1
                        } else {
                            numberTwo! *= -1
                        }
                    case "%":
                        if(numberOne != nil) {
                            numberOne! /= 100
                        } else if(numberTwo == nil) {
                            numberOne! /= 100
                        } else {
                            numberTwo! /= 100
                        }
                    case ".":
                        decimal = true
                    case "=":
                        if(numberOne != nil && numberTwo != nil && operation != nil) {
                            calculate()
                        }
                        
                    default:
                        operation = button.identifier
                    }
                }
                
            }
        }
    }
    
    
}
