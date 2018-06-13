//
//  TableItem.swift
//  Calculator
//
//  Created by Stas Shetko on 2/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

struct TableItem {
    var text: String
    var isMain: Bool
    init(with text: String, isMain: Bool = false) {
        self.text = text
        self.isMain = isMain
    }
    
    mutating func deleleLastTextCharacter() {
        if !self.text.isEmpty {
            self.text.removeLast()
        }
        
    }
}
