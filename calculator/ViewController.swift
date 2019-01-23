//
//  ViewController.swift
//  calculator
//
//  Created by Rey Matsunaga on 1/22/19.
//  Copyright © 2019 Rey Matsunaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calculator = Calculator()
    
    let calcResult = UILabel()

    var buttons: [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add background color
        view.backgroundColor = .black
        
        // Create top label for work
        calcResult.text = "0"
        calcResult.textColor = .white
        calcResult.textAlignment = NSTextAlignment.right
        calcResult.font = UIFont(name: "HelveticaNeue-UltraLight",
                                 size: 70.0)
        view.addSubview(calcResult)
        
        
        // answer's constraints
        calcResult.translatesAutoresizingMaskIntoConstraints = false
        calcResult.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calcResult.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        calcResult.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        calcResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        
        // Preparing Grid
        let rowOne = ["AC", "+/-", "%", "/"]
        let rowTwo = ["7", "8", "9", "x"]
        let rowThree = ["4", "5", "6", "-"]
        let rowFour = ["1", "2", "3", "+"]
        let rowFive = ["0", ".", "="]
        
        let rows = [rowOne, rowTwo, rowThree, rowFour, rowFive]
        
        // Configure grid
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 5
        verticalStack.distribution = .fillEqually
        
        var horizontalStackOne: UIStackView
        var horizontalStackTwo: UIStackView
        var horizontalStackThree: UIStackView
        var horizontalStackFour: UIStackView
        var horizontalStackFive: UIStackView
        
        // Configure rows
        
        for index in 0...4 {
            if(index == 0) {
                horizontalStackOne = UIStackView(arrangedSubviews: createButtons(rows[index]))
                configureStack(horizontalStackOne)
                verticalStack.addArrangedSubview(horizontalStackOne)
            } else if (index == 1) {
                horizontalStackTwo = UIStackView(arrangedSubviews: createButtons(rows[index]))
                configureStack(horizontalStackTwo)
                verticalStack.addArrangedSubview(horizontalStackTwo)
            }else if (index == 2) {
                horizontalStackThree = UIStackView(arrangedSubviews: createButtons(rows[index]))
                configureStack(horizontalStackThree)
                verticalStack.addArrangedSubview(horizontalStackThree)
            }else if (index == 3) {
                horizontalStackFour = UIStackView(arrangedSubviews: createButtons(rows[index]))
                configureStack(horizontalStackFour)
                verticalStack.addArrangedSubview(horizontalStackFour)
            } else {
                horizontalStackFive = UIStackView(arrangedSubviews: createButtons(rows[index]))
                configureStack(horizontalStackFive)
                verticalStack.addArrangedSubview(horizontalStackFive)
            }
        }
        view.addSubview(verticalStack)
        
        // Vertical Stack constraints
        
        verticalStack.topAnchor.constraint(equalTo: calcResult.topAnchor, constant: 100).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: calcResult.leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: calcResult.trailingAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func configureStack(_ stack: UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
    }
    
    private func createButtons(_ named: [String]) -> [UIButton] {
        
        return named.map { name in
            
            // Initialize basic buttons
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(name, for: .normal)
            
            
            // switch statement and configure background color and text color (in zero's case, make it default but finally make it wide
            
            switch name {
            case "AC", "+/-", "%":
                button.backgroundColor = UIColor.gray
                button.setTitleColor(.white
                    , for: .normal)
            case "/", "x", "-", "+", "=":
                button.backgroundColor = UIColor.orange
                button.setTitleColor(.white, for: .normal)
            default:
                button.backgroundColor = UIColor.darkGray
                button.setTitleColor(.white, for: .normal)
            }
            
            if(name == "0") {
                button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2)
            }
            button.layer.cornerRadius = view.frame.size.width / 8
            button.clipsToBounds = true
            
            button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
            
            buttons.append(button)
            return button
        }
    
    }
    
    @objc func buttonClick(sender: UIButton) {
        // If button is clicked, change UI and that button's model component

        
        switch sender.titleLabel!.text! {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9": calcResult.text = String(Int(calcResult.text!)! * 10 + Int(sender.titleLabel!.text!)!)
        case "AC":
            calcResult.text = "0"
        case "+/-":
            calcResult.text = String(Int(calcResult.text!)! * -1)
        case "%":
            calcResult.text = String(Int(calcResult.text!)! / 100)
        case "/", "X", "-", "+":
            sender.layer.borderColor = UIColor.yellow.cgColor
            sender.layer.borderWidth = 2
        case "=":
            calcResult.text = String(calculator.result)
        default:
            break
        }
        
        calculator.chooseButton(at: sender.titleLabel!.text!)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        // Make sure only two operators
        for index in calculator.buttons.indices {
            let current = buttons[index]
            
        }
        
        
    }



}

