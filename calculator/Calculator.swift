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
    var result: Int = 0
    
    func chooseButton(at index: String) {
        // find button
        for button in buttons {
            if(index == button.identifier) {
                // You have found the button

                // SCENARIOS TO CHANGE NUMBERONE
                if(!button.isOperator && numberOne != nil) {
                    numberOne = numberOne! * 10 + Int(button.identifier)!
                } else if (!button.isOperator && numberOne == nil) {
                    numberOne = Int(button.identifier)!
                }
                
                
                
                //SCENARIOS TO CHANGE NUMBERTWO
                
                if(numberOne != nil && operation != nil && !button.isOperator) {
                    if(numberTwo != nil) {
                        numberTwo = numberTwo! * 10 + Int(button.identifier!)
                    } else {
                        numberTwo = Int(button.identifier)
                    }
                }
                
                //SCENARIOS TO CHANGE RESULT
                
                
                
                
                
                
                
                // check if it is a number or operator
                    // if number
                        // if operation is nil
                            // numberOne is changed
                        // else
                            // numberTwo is changed
                    // else
                        // if operation is nil
                            // operation is changed
                        // else
                            // if button is =
                                // result is changed
                        // else change operation
                switch button.isOperator {
                case true:
                    if numberOne != nil {
                        button.isSelected = true
                        operation = button.identifier
                    }
                default:
                    if numberOne != nil operation != nil {
                    
                    }
                }
                
                if(numberOne == nil) {
                    switch Int(index)! {
                    case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
                        numberOne = Int(index)
                        
                    default:
                        break
                    }
                }

            }
        }
    }
    
    
}
