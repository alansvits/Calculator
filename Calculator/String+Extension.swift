//
//  String+Extension.swift
//  Calculator
//
//  Created by Stas Shetko on 5/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

extension String {
     func removeLeadingZero() -> String {
        var temp = self
        if self.hasPrefix("0") && !self.hasPrefix("0.") && self.count > 1 {

            temp.removeFirst()
            return temp
        }
        return temp
    }
}
