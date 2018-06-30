//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Stas Shetko on 3/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import Foundation

#if swift(>=4.0)
//print("Hello, Swift 4!")
#endif
import Foundation
internal enum OperatorAssociativity {
    case leftAssociative
    case rightAssociative
}

public enum OperatorType: CustomStringConvertible {
    case add
    case subtract
    case divide
    case multiply
    case percent
    case exponent
    
    public var description: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .divide:
            return "/"
        case .multiply:
            return "*"
        case .percent:
            return "%"
        case .exponent:
            return "^"
        }
    }
}

public enum TokenType: CustomStringConvertible {
    case openBracket
    case closeBracket
    case Operator(OperatorToken)
    case operand(Double)
    
    public var description: String {
        switch self {
        case .openBracket:
            return "("
        case .closeBracket:
            return ")"
        case .Operator(let operatorToken):
            return operatorToken.description
        case .operand(let value):
            return "\(value)"
        }
    }
}

public struct OperatorToken: CustomStringConvertible {
    let operatorType: OperatorType
    
    init(operatorType: OperatorType) {
        self.operatorType = operatorType
    }
    
    var precedence: Int {
        switch operatorType {
        case .add, .subtract:
            return 0
        case .divide, .multiply, .percent:
            return 5
        case .exponent:
            return 10
        }
    }
    
    var associativity: OperatorAssociativity {
        switch operatorType {
        case .add, .subtract, .divide, .multiply, .percent:
            return .leftAssociative
        case .exponent:
            return .rightAssociative
        }
    }
    
    public var description: String {
        return operatorType.description
    }
}

func <= (left: OperatorToken, right: OperatorToken) -> Bool {
    return left.precedence <= right.precedence
}

func < (left: OperatorToken, right: OperatorToken) -> Bool {
    return left.precedence < right.precedence
}

public struct Token: CustomStringConvertible {
    let tokenType: TokenType
    
    init(tokenType: TokenType) {
        self.tokenType = tokenType
    }
    
    init(operand: Double) {
        tokenType = .operand(operand)
    }
    
    init(operatorType: OperatorType) {
        tokenType = .Operator(OperatorToken(operatorType: operatorType))
    }
    
    var isOpenBracket: Bool {
        switch tokenType {
        case .openBracket:
            return true
        default:
            return false
        }
    }
    
    var isOperator: Bool {
        switch tokenType {
        case .Operator(_):
            return true
        default:
            return false
        }
    }
    
    var operatorToken: OperatorToken? {
        switch tokenType {
        case .Operator(let operatorToken):
            return operatorToken
        default:
            return nil
        }
    }
    
    public var description: String {
        return tokenType.description
    }
}

public class InfixExpressionBuilder {
    private var expression = [Token]()
    
    public func addOperator(_ operatorType: OperatorType) -> InfixExpressionBuilder {
        expression.append(Token(operatorType: operatorType))
        return self
    }
    
    public func addOperand(_ operand: Double) -> InfixExpressionBuilder {
        expression.append(Token(operand: operand))
        return self
    }
    
    public func addOpenBracket() -> InfixExpressionBuilder {
        expression.append(Token(tokenType: .openBracket))
        return self
    }
    
    public func addCloseBracket() -> InfixExpressionBuilder {
        expression.append(Token(tokenType: .closeBracket))
        return self
    }
    
    public func removeLastToken() {
        expression.removeLast()
    }
    
    public func removeAllTokens() {
        expression.removeAll()
    }
    
    public func build() -> [Token] {
        // Maybe do some validation here
        return expression
    }
}

// This returns the result of the shunting yard algorithm
public func reversePolishNotation(_ expression: [Token]) -> String {
    
    var tokenStack = Stack<Token>()
    var reversePolishNotation = [Token]()
    
    for token in expression {
        switch token.tokenType {
        case .operand(_):
            reversePolishNotation.append(token)
            
        case .openBracket:
            tokenStack.push(token)
            
        case .closeBracket:
            while tokenStack.count > 0, let tempToken = tokenStack.pop(), !tempToken.isOpenBracket {
                reversePolishNotation.append(tempToken)
            }
            
        case .Operator(let operatorToken):
            for tempToken in tokenStack.makeIterator() {
                if !tempToken.isOperator {
                    break
                }
                
                if let tempOperatorToken = tempToken.operatorToken {
                    if operatorToken.associativity == .leftAssociative && operatorToken <= tempOperatorToken
                        || operatorToken.associativity == .rightAssociative && operatorToken < tempOperatorToken {
                        reversePolishNotation.append(tokenStack.pop()!)
                    } else {
                        break
                    }
                }
            }
            tokenStack.push(token)
        }
    }
    
    while tokenStack.count > 0 {
        reversePolishNotation.append(tokenStack.pop()!)
    }
    
    return reversePolishNotation.map({token in token.description}).joined(separator: " ")
}

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.pop() }
    }
}
// Simple demo

let expr = InfixExpressionBuilder()
    .addOperand(3)
    .addOperator(.add)
    .addOperand(4)
    .addOperator(.multiply)
    .addOperand(2)
    .addOperator(.divide)
    .addOpenBracket()
    .addOperand(1)
    .addOperator(.subtract)
    .addOperand(5)
    .addCloseBracket()
    .addOperator(.exponent)
    .addOperand(2)
    .addOperator(.exponent)
    .addOperand(3)
    .build()

//print(expr.description)
//print(reversePolishNotation(expr))
//var rpn = reversePolishNotation(expr).split(separator: " ")
//
//
//var myOperandsStack = Stack<String>()
//var numberStack = Stack<Int>()
//
//for item in rpn {
//
//    switch item {
//    case Int(item) != nil:
//        numberStack.push(Int(item))
//    case "+":
//        let right = numberStack.pop()
//        let left = numberStack.pop()
//        let temp = left + right
//        numberStack.push(temp)
//    case "-":
//        let right = numberStack.pop()
//        let left = numberStack.pop()
//        let temp = left - right
//        numberStack.push(temp)
//    case "*":
//        let right = numberStack.pop()
//        let left = numberStack.pop()
//        let temp = left * right
//        numberStack.push(temp)
//    case "/":
//        let right = numberStack.pop()
//        let left = numberStack.pop()
//        let temp = left / right
//        numberStack.push(temp)
//    default:
//        return 1
//    }
//}

