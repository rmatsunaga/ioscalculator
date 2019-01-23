//
//  Numbers.swift
//  calculator
//
//  Created by Rey Matsunaga on 1/22/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

import Foundation

struct CalcButton
{
    var isSelected = false
    let isOperator: Bool
    let identifier: String
    
    init(_ identifier: String) {
        self.identifier = identifier
        switch identifier {
        case "/", "X", "-", "+", "AC", "+/-", "%", "=":
            isOperator = true
        default:
            isOperator = false
        }
    }
    
    
}

