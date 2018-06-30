//
//  ViewController.swift
//  Calculator
//
//  Created by Stas Shetko on 1/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Number buttons properties
    @IBOutlet weak var zeroButton: DesignableButton!
    @IBOutlet weak var oneButton: DesignableButton!
    @IBOutlet weak var twoButton: DesignableButton!
    @IBOutlet weak var threeButton: DesignableButton!
    @IBOutlet weak var fourButton: DesignableButton!
    @IBOutlet weak var fiveButton: DesignableButton!
    @IBOutlet weak var sixButton: DesignableButton!
    @IBOutlet weak var sevenButton: DesignableButton!
    @IBOutlet weak var eightButton: DesignableButton!
    @IBOutlet weak var nineButton: DesignableButton!
    
    //MARK: - Action buttons properties
    @IBOutlet weak var allClearButton: DesignableButton!
    @IBOutlet weak var clearButton: DesignableButton!
    @IBOutlet weak var deleteButton: DesignableButton!
    @IBOutlet weak var divisionButton: DesignableButton!
    @IBOutlet weak var multiplicationButton: DesignableButton!
    @IBOutlet weak var subtractionButton: DesignableButton!
    @IBOutlet weak var additionButton: DesignableButton!
    @IBOutlet weak var equalityButton: DesignableButton!
    @IBOutlet weak var decimalButton: DesignableButton!
    @IBOutlet weak var divisionBy100Button: DesignableButton!
    
    //MARK: - Actions IBOutlets
    
    //Number buttons
    @IBAction func zeroButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        print("ONE pressed\n")
        mainRow.numberText += "1"
        printToConsole(this: mainRow.text, of: "text is: ")
        updateRowsArrayWithMainRow()
        
        if globalClickCounter == 0 {
            expression.removeLastToken()
            globalClickCounter += 1
        }
        let tokArr = currentTokensArray(rowsArray: rowsArray)
        printToConsole(this: tokArr, of: "tokArray is :")
        let RPN = reversePolishNotation(tokArr)
        let resultRPN = solveRPN(exp: RPN)
        
        if let res = resultRPN {
            secondaryRow.numberText = String(res)
            secondaryRow.sign = "="
        }
        
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
        
        globalClickCounter += 1
        
        tableView.reloadData()
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        
    }
    
    //MARK: Other buttons
    @IBAction func allClearButton(_ sender: Any) {
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("deleteButton pressed\n")

    }
    
    @IBAction func divisionButtonPressed(_ sender: Any) {
    }
    @IBAction func multiplicationButtonPressed(_ sender: Any) {
    }
    @IBAction func subtractionButtonPressed(_ sender: Any) {
    }
    @IBAction func additionButtonPressed(_ sender: Any) {
        
    }
    @IBAction func equalityButtonPressed(_ sender: Any) {
    }
    @IBAction func decimalButtonPressed(_ sender: Any) {
        print("decimalButton pressed\n")

    }
    @IBAction func divisionBy100ButtonPressed(_ sender: Any) {
    }
    //MARK: - Properties
    let example = ["= 0", "- 0", "-0000000000000000", "-----------------------", "= 4", "x 2", "2", "-----------------------", "= 4","x 2", "2"]
    
    var numberButtonsClickCouter = 0
    var globalClickCounter = 0
    let textTableCellIdentifier = "tableCell"
    
    var rowsArray = [TableItem]()
    var mainRow = TableItem(isMain: true)
    var secondaryRow = TableItem()
    
    //MARK: Infix expression
    var expression = InfixExpressionBuilder()
    
    //MARK: DecimalSign
    let decimalSign = "."
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        mainRow.numberText = "0"
        
        insertRowTo(array: &rowsArray, row: &mainRow, at: 0)
        currentTokensArray(rowsArray: rowsArray)
        print("viewDidLoad:\n")
        printToConsole(this: expression.build(), of: "exp is: ")
        
        printToConsole(this: expression.build().description, of: "tokens array is :")
        tableView.reloadData()
        printToConsole(this: mainRow.numberText, of: "numberText is: ")

        printToConsole(this: mainRow.text, of: "text is: ")
        printToConsole(this: mainRow.isNumDoubleEqualNumInt, of: "is equal: ")
    }
    
}

//MARK: - Helper functions
extension ViewController {
    
    private func printToConsole(this: Any, of: String) {
        print("\(String(describing: of.description)) is \(this)")
    }
    
    func insertRowTo(array: inout [TableItem], row: inout TableItem, at index: Int) {
        array.insert(row, at: index)
    }
    
    func updateRowsArray() {
        if rowsArray.count == 1 {
            rowsArray.insert(secondaryRow, at: 0)
        }
    }
    
    func updateRowsArrayWithMainRow() {
        if rowsArray.count == 1 {
            rowsArray.removeFirst()
            rowsArray.insert(mainRow, at: 0)
        } else {
            rowsArray.remove(at: 1)
            rowsArray.insert(mainRow, at: 1)
        }
    }
    func updateRowsArray(main: TableItem, secondRow: TableItem) {
        if rowsArray.count == 1 {
            rowsArray.insert(secondRow, at: 0)
            rowsArray.remove(at: 1)
            rowsArray.append(main)
        } else {
            let arr: [TableItem] = [secondRow, main]
            rowsArray.replaceSubrange(0...1, with: arr)
        }
    }
    
    func solveRPN(exp: String) -> Double? {
        var numberStack = Stack<Double>()
        //        let subStringArray = exp.split(separator: " ")
        let subStringArray = RPNValidation(rpn: exp)
        for item in subStringArray {
            
            if let num = Double(String(item)) {
                numberStack.push(num)
            } else {
                switch item {
                case "+":
                    let right = numberStack.pop()
                    let left = numberStack.pop()
                    let temp = left! + right!
                    numberStack.push(temp)
                case "-":
                    let right = numberStack.pop()
                    let left = numberStack.pop()
                    let temp = left! - right!
                    numberStack.push(temp)
                case "*":
                    let right = numberStack.pop()
                    let left = numberStack.pop()
                    let temp = left! * right!
                    numberStack.push(temp)
                case "/":
                    let right = numberStack.pop()
                    if right == 0 {
                        return nil
                    }
                    let left = numberStack.pop()
                    let temp = left! / right!
                    numberStack.push(temp)
                default:
                    continue
                }
            }
        }
        
        print("stack.top is \(numberStack.top)")
        return Double(numberStack.top!)
        
    }
    
    func RPNValidation(rpn: String) -> [Substring] {
        var subStr = rpn.split(separator: " ")
        let numberOfArrayElements = subStr.count
        let evenOrOdd = numberOfArrayElements % 2
        if evenOrOdd == 0 {
            subStr.removeLast()
            return subStr
        } else {
            return subStr
        }
    }
    
    func currentTokensArray(rowsArray: [TableItem]) -> [Token] {
        expression.removeAllTokens()
        
        if rowsArray.count >= 1 {
            var tempArray = rowsArray
            tempArray.reverse()
            if rowsArray.count != 1 {
                tempArray.removeLast()
            }
            for item in tempArray {
                if let sign = item.sign {
                    if sign == "+" {
                        expression.addOperator(.add)
                    }
                    if sign == "-" {
                        expression.addOperator(.subtract)
                    }
                    if sign == "×" {
                        expression.addOperator(.multiply)
                    }
                    if sign == "÷" {
                        expression.addOperator(.divide)
                    }
                }
                if let numberDouble = item.numberDouble {
                    expression.addOperand(numberDouble)
                }
            }
        }
        
        return expression.build()
    }
    
}
//MARK: - TableView delegate, datasource functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textTableCellIdentifier, for: indexPath ) as! TableViewCell
        if rowsArray[indexPath.row].isMain {
            cell.myTextLabel.font = UIFont.systemFont(ofSize: 56)
            cell.myTextLabel.textColor = UIColor.black
        }
        if !rowsArray[indexPath.row].isMain {
            cell.myTextLabel.font = UIFont.systemFont(ofSize: 30)
            cell.myTextLabel.textColor = UIColor.gray
        }
        cell.myTextLabel.text = rowsArray[indexPath.row].text
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
}

extension ViewController {
    //MARK: - Numbers of keyboard
    enum NumberKeyboard: Int {
        case zero = 0, one, two, three, four, five, six, seven, eight, nine
    }
    
}
