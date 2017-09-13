//
//  ViewController.swift
//  Calculator
//
//  Created by Hany Arafa on 9/12/17.
//  Copyright © 2017 Hany Arafa. All rights reserved.
// Some parts of this calculator were referenced from the following links:
//https://github.com/fnk0/iOS-Calculator-Tutorial
//https://github.com/ursooperduper/calculator/blob/master/Calculator/ViewController.swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelres: UILabel!
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func butclear(_ sender: Any) {
        labelres.text = ""
        firstNumberText = ""
        secondNumberText = ""
        canClear = true
    }
    
    
    @IBAction func plusminus(_ sender: Any) {
        if canClear {
            labelres.text = ""
            canClear = false
        }
        let firstNumber = Double(firstNumberText)!
        let neg = -firstNumber
        labelres.text = "\(neg)"
        
    }
    
    
    @IBAction func pressbutton(_ sender: UIButton) {
        if canClear {
            labelres.text = ""
            canClear = false
        }
        let currentText = labelres.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "x", "/", "-", "+/-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                labelres.text = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                labelres.text = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                labelres.text = "\(currentText)\(text)"
                break;
            }
        }}



func calculate() -> Double {
    let firstNumber = Double(firstNumberText)!
    let secondNumber = Double(secondNumberText)!
    firstNumberText = ""
    secondNumberText = ""
    switch op {
    case "+":
        return firstNumber + secondNumber
    case "-":
        return firstNumber - secondNumber
    case "x":
        return firstNumber * secondNumber
    case "/":
        return firstNumber / secondNumber
    case "+/-":
        return firstNumber * -1
    default:
        return 0
    }
}
}
