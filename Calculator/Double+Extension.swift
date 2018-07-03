//
//  Double+Extension.swift
//  Calculator
//
//  Created by Stas Shetko on 2/07/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

extension Double {
    func isEqualToConvertedToInt() -> Bool {
        let temp = self
        let tempConverted = Double(Int(temp))
        if temp == tempConverted {
            return true
        } else {
            return false
        }
    }
}
