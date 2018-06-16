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
    
    var numberPart: Double {
        if text.isEmpty {
            return Double(0)
        } else if (text.first == "+" || text.first == "-" || text.first == "/" || text.first == "*") && text.count == 1 {
            return Double(0)
        } else if !(text.first == "+" || text.first == "-" || text.first == "/" || text.first == "*") && text.count == 1 {
            let temp = text
            return Double(temp)!
        } else if !(text.first == "+" || text.first == "-" || text.first == "/" || text.first == "*") && text.count != 1 {
            let temp = text
            return Double(temp)!
        } else {
            print(text)
            let temp = String(text.dropFirst())
            return Double(temp)!
        }
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
