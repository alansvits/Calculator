//
//  Numeric+Extension.swift
//  Calculator
//
//  Created by Stas Shetko on 3/07/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

extension Numeric {
    var customFormatted: String {
        return NumberFormatter.customFormat.string(from: self as! NSNumber) ?? ""
    }
}
