//
//  Formatter+Extension.swift
//  Calculator
//
//  Created by Stas Shetko on 3/07/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static let customFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter
    }()
}
