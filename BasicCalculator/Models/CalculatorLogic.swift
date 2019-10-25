//
//  CalculatorLogic.swift
//  BasicCalculator
//
//  Created by Gbemileke AJIBOYE on 10/24/19.
//  Copyright © 2019 Gbemileke AJIBOYE. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number : Double?;
    
    private var intermediateCalculation : (number: Double, operation: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }

    mutating func calculte(method : String) -> Double?{
        var result : Double? = nil
        if let number = self.number {
            if method == "+/-" {
                result = number * -1
            }else if method == "%" {
                result = number/100
            }else if method == "=" {
                result = performTwoNumberCalculation(number: number)
            }else {
                intermediateCalculation = (number, method)
            }
        }else if method == "AC" {
            intermediateCalculation = nil
            number = nil
            result = 0
        }
        return result
    }
    
    private func performTwoNumberCalculation(number : Double) -> Double?{
        if let number2 = intermediateCalculation?.number,
            let operation = intermediateCalculation?.operation
        {
            switch operation {
                case "+" :
                    return number + number2;
            case "-" :
                return number - number2;
            case "X" :
                return number * number2;
            case "÷" :
                return number2 == 0 ? nil : number/number2
            default :
                return nil
            }
            
        }
        return nil
    }
}
