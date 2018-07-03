//
//  TableItem.swift
//  Calculator
//
//  Created by Stas Shetko on 2/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

struct TableItem {
    
    var sign: String?
    
    var inputNumberString: String = ""
    
    var numberDouble: Double? {
        return inputNumberStringToDouble()
    }
    
    var numberInt: Int? {
        if let numberDouble = numberDouble {
            return Int(numberDouble)
        } else {
            return nil
        }
    }
    
    var isNumDoubleEqualNumInt: Bool {
        if let numberInt = numberInt {
            return numberDouble == Double(numberInt)
        } else {
            return false
        }
    }
    
    
    var text: String {
        if let sign = sign {
            return sign + " " + inputNumberString.removeLeadingZero()
        } else {
            return inputNumberString.removeLeadingZero()
        }
    }
    
    var inputNumberStringCount: Int {
        return inputNumberString.removeLeadingZero().count
    }
    
    var isMain: Bool
    
    init(number: Double? = nil, sign: String? = nil, isMain: Bool = false) {
        self.sign = sign
        self.isMain = isMain
    }
    
    private func inputNumberStringToDouble() -> Double? {
        if inputNumberString == "." {
            return 0
        } else {
            return Double(self.inputNumberString)
        }
    }
    
}
