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
        print("ZERO pressed\n")
        buttonPressedNumber("0")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        
    }
    
    fileprivate func buttonPressedNumber(_ number: String) {
        
        mainRow.inputNumberString += number
        
        updateRowsArrayWithMainRow()
        let RPN = reversePolishNotation(currentTokensArray(rowsArray: rowsArray))
        let solvedRPN = solveRPN(exp: RPN)
        if let answer = solvedRPN {
            if answer.isEqualToConvertedToInt() {
                secondaryRow.inputNumberString = String(Int(answer))
            } else {
                secondaryRow.inputNumberString = String(answer)
            }
        }
        secondaryRow.sign = "="
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        print("ONE pressed\n")
        buttonPressedNumber("1")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
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
        
        if mainRow.inputNumberStringCount > 0 && !(mainRow.inputNumberStringCount == 1 && mainRow.inputNumberString == "0") {
            mainRow.inputNumberString.removeLast()
            buttonPressedNumber("")
        } else if mainRow.sign != nil {
            mainRow.sign = nil
            buttonPressedNumber("")
            if rowsArray.count > 2 {
                mainRow = rowsArray[2]
                mainRow.isMain = true
                rowsArray.remove(at: 2)
                buttonPressedNumber("")
            }
        } else {
            if rowsArray.count > 2 {
                mainRow = rowsArray[2]
                mainRow.isMain = true
                rowsArray.remove(at: 2)
                buttonPressedNumber("")
            }
        }
        
        
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
    }
    
    @IBAction func divisionButtonPressed(_ sender: Any) {
    }
    @IBAction func multiplicationButtonPressed(_ sender: Any) {
    }
    @IBAction func subtractionButtonPressed(_ sender: Any) {
    }
    @IBAction func additionButtonPressed(_ sender: Any) {
        print("Addition button pressed\n")
        if mainRow.inputNumberStringCount > 0 {
            buttonPressedNumber("") //update rowsArray
            copyMainRow()
            mainRow.sign = "+"
            mainRow.inputNumberString = ""
            buttonPressedNumber("")
            
        }
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        tableView.reloadData()
    }
    @IBAction func equalityButtonPressed(_ sender: Any) {
    }
    @IBAction func decimalButtonPressed(_ sender: Any) {
        print("decimalButton pressed\n")
        if !mainRow.inputNumberString.contains(".") {
            buttonPressedNumber(decimalSign)
            
            printInfo(about: mainRow, "mainRow")
            printInfo(about: secondaryRow, "secondaryRow")
            printToConsole(this: expression.build(), of: "expression")
            printToConsole(this: expression.build().description, of: "tokens array")
        }
        tableView.reloadData()
        
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
        
        mainRow.inputNumberString = "0"
        insertRowTo(array: &rowsArray, row: &mainRow, at: 0)
        //        currentTokensArray(rowsArray: rowsArray)
        print("viewDidLoad:\n")
        printToConsole(this: expression.build(), of: "expression")
        
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        
        printInfo(about: mainRow, "mainRow")
    }
    
}

//MARK: - Helper functions
extension ViewController {
    
    private func printToConsole(this: Any, of: String) {
        print("\(String(describing: of.description)) = \(this)")
    }
    
    private func printInfo(about item: TableItem, _ name: String) {
        print("\(name)----------------")
        let mirrored_object = Mirror(reflecting: item)
        for (index, attr) in mirrored_object.children.enumerated() {
            if let propertyName = attr.label as String! {
                print("Attr \(index): \(propertyName) = \(attr.value)")
            }
        }
        printToConsole(this: item.text, of: "text")
        printToConsole(this: item.inputNumberStringCount, of: "inputNumberStringCount")
        printToConsole(this: item.numberDouble, of: "numberDouble")
        printToConsole(this: item.numberInt, of: "numberInt")
        printToConsole(this: item.isNumDoubleEqualNumInt, of: "isNumDoubleEqualNumInt")
        print("----------------")
        
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
    
    private func copyMainRow() {
        var temp = mainRow
        temp.isMain = false
        if rowsArray.count == 2 {
            rowsArray.append(temp)
        } else {
            rowsArray.insert(temp, at: 2)
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
        
        //        print("stack.top is \(numberStack.top)")
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
