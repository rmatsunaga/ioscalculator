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
    var numberOne: Int? = nil
    var numberTwo: Int? = nil
    var result: Int? = nil
    var decimal: Bool = false
    
    init() {
        buttons.append(CalcButton.init("AC"))
        buttons.append(CalcButton.init("+/-"))
        buttons.append(CalcButton.init("%"))
        buttons.append(CalcButton.init("/"))
        
        buttons.append(CalcButton.init("7"))
        buttons.append(CalcButton.init("8"))
        buttons.append(CalcButton.init("9"))
        buttons.append(CalcButton.init("*"))
        
        buttons.append(CalcButton.init("4"))
        buttons.append(CalcButton.init("5"))
        buttons.append(CalcButton.init("6"))
        buttons.append(CalcButton.init("-"))
        
        buttons.append(CalcButton.init("1"))
        buttons.append(CalcButton.init("2"))
        buttons.append(CalcButton.init("3"))
        buttons.append(CalcButton.init("+"))
        
        buttons.append(CalcButton.init("0"))
        buttons.append(CalcButton.init("."))
        buttons.append(CalcButton.init("="))
    }
    func calculate() {
        print("calculated")
        if(operation == "/") {
            result = numberOne! / numberTwo!
        } else if(operation == "*") {
            result = numberOne! * numberTwo!
        } else if(operation == "-") {
            result = numberOne! - numberTwo!
        } else {
            result = numberOne! + numberTwo!
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
                        numberOne = Int(button.identifier)!
                        print("numberOne initialized")
                    } else if(numberOne != nil && operation == nil) {
                        numberOne = numberOne! * 10 + Int(button.identifier)!
                        print("numberOne modified")
                    } else if(numberOne != nil && operation != nil) {
                        if(numberTwo == nil) {
                            numberTwo = Int(button.identifier)!
                            print("numberTwo initialized")
                        } else {
                            numberTwo = numberTwo! * 10 + Int(button.identifier)!
                            print("NumberTwo modified")
                        }
                    }
                } else {
                // button is either an operator or modifier or =
                    switch button.identifier {
                    case "AC":
                        numberOne = nil
                        numberTwo = nil
                        operation = nil
                        result = nil
                        print("allShit Cleared")
                    case "+/-":
                        if(numberOne != nil) {
                            numberOne! *= -1
                            print("numberOne been modified")
                        } else if(numberTwo == nil) {
                            numberOne! *= -1
                            print("numberOne been modified")
                        } else {
                            numberTwo! *= -1
                            print("numberTwo been modified")
                        }
                    case "%":
                        if(numberOne != nil) {
                            numberOne! /= 100
                            print("numberOne been modified")
                        } else if(numberTwo == nil) {
                            numberOne! /= 100
                            print("numberOne been modified")
                        } else {
                            numberTwo! /= 100
                            print("numberTwo been modified")
                        }
                    case ".":
                        decimal = true
                    case "=":
                        calculate()
                    default:
                        operation = button.identifier
                    }
                }
                
            }
        }
    }
    
    
}
