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
    var numberPart: Double? {
        if text == " " || text == "0" {
            return 0
        } else if text.contains("+") {
            var temp = text
            temp.removeFirst()
            return Double(temp)!
        } else {
            return nil
        }
    }
    
    init(with text: String, isMain: Bool = false) {
        self.text = text
        self.isMain = isMain
    }
    
    mutating func deleleLastTextCharacter() {
        if !self.text.isEmpty {
            self.text.removeLast()
        }
    }
    
    mutating func addToText(_ text: String) {
//        removeZero()
        self.text = self.text + text
    }
    
    mutating func setText(_ text: String) {
            self.text = text
    }
    
    mutating func removeZero() {
        if self.text.count == 1 && self.text == "0" {
            self.text = ""
        }
    }
}
