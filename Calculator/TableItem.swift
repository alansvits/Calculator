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
    
    var numberText: String = ""
    
    var numberDouble: Double? {
        return Double(numberText)
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
        if !isNumDoubleEqualNumInt {
            if let numberDouble = numberDouble {
                if let sign = sign {
                    return sign + " " + String(numberDouble)
                } else {
                    return String(numberDouble)
                }
            } else {
                if let sign = sign {
                    return sign
                } else {
                    return ""
                }
            }
        } else {
            if let numberDouble = numberInt {
                if let sign = sign {
                    return sign + " " + String(numberDouble)
                } else {
                    return String(numberDouble)
                }
            } else {
                if let sign = sign {
                    return sign
                } else {
                    return ""
                }
            }
        }
        
    }
    
    var isMain: Bool
    
    init(number: Double? = nil, sign: String? = nil, isMain: Bool = false) {
        if let number = number {
          self.numberText = String(number)
        }
        self.sign = sign
        self.isMain = isMain
    }
    
    
}
