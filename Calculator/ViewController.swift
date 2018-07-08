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
        separatorFladProccesing()
        
        buttonPressedNumber("0")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
        
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
        } else if solvedRPN == nil && mainRow.inputNumberString == "0" {
            secondaryRow.inputNumberString = "Can't divide by zero"
        }
        secondaryRow.sign = "="
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
    }
    
    fileprivate func separatorFladProccesing() {
        if separatorFlag {
            mainRow.isMain = false
            secondaryRow.isMain = false
            rowsArray.insert(mainRow, at: 2)
            rowsArray.insert(secondaryRow, at: 2)
            mainRow.isSeparator = true
            rowsArray.insert(mainRow, at: 2)
            mainRow.isSeparator = false
            mainRow.isMain = true
            mainRow.sign = nil
            mainRow.inputNumberString = ""
            separatorFlag = false
            updateRowsArray(main: mainRow, secondRow: secondaryRow)
            
            printToConsole(this: separatorFlag, of: "separatorFlag is ")
            printInfo(about: mainRow, "mainRow")
            printInfo(about: secondaryRow, "secondaryRow")
            printToConsole(this: expression.build(), of: "expression")
            printToConsole(this: expression.build().description, of: "tokens array")
        }
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        print("ONE pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("1")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        print("twoButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("2")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
        
    }
    @IBAction func threeButtonPressed(_ sender: Any) {
        print("threeButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("3")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
    }
    @IBAction func fourButtonPressed(_ sender: Any) {
        print("fourButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("4")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
        
    }
    @IBAction func fiveButtonPressed(_ sender: Any) {
        print("fiveButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("5")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
    }
    @IBAction func sixButtonPressed(_ sender: Any) {
        print("sixButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("6")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
    }
    @IBAction func sevenButtonPressed(_ sender: Any) {
        print("sevenButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("7")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
    }
    @IBAction func eightButtonPressed(_ sender: Any) {
        print("eightButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("8")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
    }
    @IBAction func nineButtonPressed(_ sender: Any) {
        print("nineButton pressed\n")
        separatorFladProccesing()
        
        buttonPressedNumber("9")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        tableView.reloadData()
        AllClearOrClearButtonToShow()
        
    }
    
    //MARK: Other buttons
    @IBAction func allClearButton(_ sender: Any) {
        print("allClearButton pressed\n")
        expression.removeAllTokens()
        rowsArray.removeAll()
        separatorFlag = false
        mainRow.inputNumberString = "0"
        mainRow.isMain = true
        mainRow.sign = nil
        rowsArray.append(mainRow)
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        tableView.reloadData()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        print("clearButton pressed\n")
        if !expression.build().isEmpty {
            expression.removeAllTokens()
            for item in rowsArray {
                if item.isSeparator == true {
                    break
                } else {
                    rowsArray.removeFirst()
                }
            }
            mainRow.inputNumberString = "0"
            mainRow.isMain = true
            mainRow.sign = nil
            rowsArray.insert(mainRow, at: 0)
            clearButton.isHidden = true
        }
        
        separatorFlag = false
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("deleteButton pressed\n")
        //TODO: - fix deletion after equilbutton
        if !separatorFlag {
            if mainRow.inputNumberStringCount > 0 && !(mainRow.inputNumberStringCount == 1 && mainRow.inputNumberString == "0") {
                mainRow.inputNumberString.removeLast()
                if mainRow.inputNumberString == "" && mainRow.sign == nil {
                    buttonPressedNumber("0")
                } else {
                    buttonPressedNumber("")
                }
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
                if rowsArray.count > 2 && expression.build().count > 1 {
                    mainRow = rowsArray[2]
                    mainRow.isMain = true
                    rowsArray.remove(at: 2)
                    buttonPressedNumber("")
                }
            }
        }
        
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    
    @IBAction func divisionButtonPressed(_ sender: Any) {
        print("divisionButton  pressed\n")
        separatorFlagProccesingForOperators()
        updateMainRowsWithOperator("÷")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    @IBAction func multiplicationButtonPressed(_ sender: Any) {
        print("multiplication button pressed\n")
        separatorFlagProccesingForOperators()
        updateMainRowsWithOperator("×")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    @IBAction func subtractionButtonPressed(_ sender: Any) {
        print("subtraction button pressed\n")
        separatorFlagProccesingForOperators()
        updateMainRowsWithOperator("-")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
    }
    fileprivate func separatorFlagProccesingForOperators() {
        if separatorFlag {
            mainRow.isMain = false
            secondaryRow.isMain = false
            rowsArray.insert(mainRow, at: 2)
            rowsArray.insert(secondaryRow, at: 2)
            mainRow.isSeparator = true
            rowsArray.insert(mainRow, at: 2)
            mainRow.isSeparator = false
            mainRow.isMain = true
            mainRow.sign = nil
            mainRow.inputNumberString = secondaryRow.inputNumberString
            separatorFlag = false
            updateRowsArray(main: mainRow, secondRow: secondaryRow)
            printInfo(about: mainRow, "mainRow")
            printInfo(about: secondaryRow, "secondaryRow")
            printToConsole(this: expression.build(), of: "expression")
            printToConsole(this: expression.build().description, of: "tokens array")
        }
    }
    
    fileprivate func updateMainRowsWithOperator(_ sign: String) {
        if mainRow.inputNumberStringCount > 0 {
            buttonPressedNumber("") //update rowsArray
            copyMainRow()
            mainRow.sign = sign
            mainRow.inputNumberString = ""
            buttonPressedNumber("")
        } else {
            mainRow.sign = sign
            mainRow.inputNumberString = ""
            updateRowsArrayWithMainRow()
        }
    }
    
    @IBAction func additionButtonPressed(_ sender: Any) {
        print("Addition button pressed\n")
        separatorFlagProccesingForOperators()
        updateMainRowsWithOperator("+")
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")

        tableView.reloadData()
                AllClearOrClearButtonToShow()
    }
    @IBAction func equalityButtonPressed(_ sender: Any) {
        print("equalityButton pressed\n")
        if separatorFlag == false && expression.build().count != 0 {
            separatorFlag = true
            mainRow.isMain = false
            secondaryRow.isMain = true
            updateRowsArray(main: mainRow, secondRow: secondaryRow)
            
        }
        tableView.reloadData()
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
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
        
        AllClearOrClearButtonToShow()
        
        tableView.reloadData()
        
    }
    @IBAction func divisionBy100ButtonPressed(_ sender: Any) {
        print("divisionBy100Button pressed")
        
        if separatorFlag {
            mainRow.isMain = false
            secondaryRow.isMain = false
            rowsArray.insert(mainRow, at: 2)
            rowsArray.insert(secondaryRow, at: 2)
            mainRow.isSeparator = true
            rowsArray.insert(mainRow, at: 2)
            mainRow.isSeparator = false
            mainRow.isMain = true
            mainRow.sign = nil
            if secondaryRow.numberDouble != 0 {
                if let tempDouble = secondaryRow.dividedBy100() {
                    mainRow.inputNumberString = tempDouble.description
                    buttonPressedNumber("")
                }
            } else {
                mainRow.inputNumberString = secondaryRow.inputNumberString
            }
            separatorFlag = false
            updateRowsArray(main: mainRow, secondRow: secondaryRow)

        } else {
            if mainRow.numberDouble != 0 {
                if let tempDouble = mainRow.dividedBy100() {
                    mainRow.inputNumberString = String(tempDouble)
                }
                buttonPressedNumber("")
            }
        }
        
        printInfo(about: mainRow, "mainRow")
        printInfo(about: secondaryRow, "secondaryRow")
        printToConsole(this: expression.build(), of: "expression")
        printToConsole(this: expression.build().description, of: "tokens array")
        
        tableView.reloadData()
        
    }
    //MARK: - Properties
    let example = ["= 0", "- 0", "-0000000000000000", "-----------------------", "= 4", "x 2", "2", "-----------------------", "= 4","x 2", "2"]
    
    var separatorFlag = false
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
        AllClearOrClearButtonToShow()
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
    
    private func AllClearOrClearButtonToShow() {
        if expression.build().isEmpty {
            allClearButton.isHidden = false
            clearButton.isHidden = true
        } else {
            allClearButton.isHidden = true
            clearButton.isHidden = false
        }
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
            if rowsArray[1].isSeparator == true {
                rowsArray.insert(mainRow, at: 0)
            } else {
                rowsArray.remove(at: 1)
                rowsArray.insert(mainRow, at: 1)
            }
        }
    }
    
    func updateRowsArray(main: TableItem, secondRow: TableItem) {
        if rowsArray.count == 1 {
            rowsArray.insert(secondRow, at: 0)
            rowsArray.remove(at: 1)
            rowsArray.append(main)
        } else {
            let arr: [TableItem] = [secondRow, main]
            if rowsArray[1].isSeparator == true {
                rowsArray.removeFirst()
                rowsArray.insert(arr[1], at: 0)
                rowsArray.insert(arr[0], at: 0)
            } else {
                rowsArray.replaceSubrange(0...1, with: arr)
            }
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
            if tempArray.count != 1 {
                let last = tempArray.removeLast()
            }
            
            
            
            for item in tempArray {
                if item.isSeparator == true {
                    expression.removeAllTokens()
                    continue
                }
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
