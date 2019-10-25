//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Gbemileke AJIBOYE on 10/21/19.
//  Copyright © 2019 Gbemileke AJIBOYE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true;
    
    private var displayValue : Double {
        get {
            guard let number : Double = Double(displayLabel.text!) else {
                fatalError("can not convert nill to double");
            }
            return number
        }
        set {
            if(newValue == 0){
                displayLabel.text = String("0")
            }else{
                 displayLabel.text = String(newValue)
            }
        }
    }
    
    private var calculator : CalculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calMethod = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculte(method: calMethod) {
                displayValue = result
            }else{
                displayValue = 0
            }
        }
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let textValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = textValue == "." ? "0." : textValue
                isFinishedTypingNumber = false
            }else {
                if textValue == "." {
                    let textAlreadyHasDecimal = displayLabel.text!.firstIndex(of: ".") != nil
                    if textAlreadyHasDecimal {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + textValue
            }
        }
    }
}

