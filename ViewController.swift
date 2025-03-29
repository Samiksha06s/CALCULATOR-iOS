//   **SAMIKSHA SONUNE**
//  ViewController.swift
//  Calculator
//
//  Created by Samiksha Sudhakar Sonune on 29/03/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculatorWorkings: UILabel!
    @IBOutlet var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }

    @IBAction func equalsTap(_ sender: Any) {
        
        
       
        var expressionString = workings
                .replacingOccurrences(of: "x", with: "*")  
                .replacingOccurrences(of: "÷", with: "/")  
                .replacingOccurrences(of: "%", with: "*0.01") 

            if validInput() {
                let expression = NSExpression(format: expressionString)
                if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                    let resultString = formatResult(result: result)
                    calculatorResults.text = resultString
                } else {
                    calculatorResults.text = "Error"
                }
            } else {
                calculatorResults.text = "Invalid Input"
            }
        func validInput() -> Bool {
            if workings.isEmpty {
                return false
            }
            
            let lastChar = String(workings.last!)
            if ["+", "-", "x", "÷", "."].contains(lastChar) {
                return false // Avoid invalid ending with operators
            }
            
            return true
        }
        func formatResult(result: Double) -> String {
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                return String(format: "%.0f", result) 
            } else {
                return String(format: "%.2f", result) 
            }
        }


    }
    
    @IBAction func clearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func plusMinusButton(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func percentTapButton(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func divideTapButton(_ sender: Any) {
        addToWorkings(value: "÷")
    }
    @IBAction func multiplyTapButton(_ sender: Any) {
        addToWorkings(value: "x")
    }
    @IBAction func subtractTapButton(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func addTapButton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func decimalTapButton(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func zeroTapButton(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTapButton(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTappedButton(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func threeTapButton(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTapButton(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTapButton(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTapButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTapButton(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTapButton(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTapButton(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
}

