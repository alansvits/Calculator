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
        updateRowText(&mainRow, with: String(NumberKeyboard.one.rawValue))
        updateRowText(&secondaryRow, with: mainRow.text)
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
        tableView.reloadData()
        print("mainRow.text is \(mainRow.text)\n secondRow is \(secondaryRow.text)\n rowsArr is \(rowsArray)")
    }
    @IBAction func twoButtonPressed(_ sender: Any) {
        updateRowText(&mainRow, with: String(NumberKeyboard.two.rawValue))
        updateRowText(&secondaryRow, with: mainRow.text)
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
        tableView.reloadData()
        print("mainRow.text is \(mainRow.text)\n secondRow is \(secondaryRow.text)\n rowsArr is \(rowsArray)")
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
        mainRow.deleleLastTextCharacter()
        defaultZero(when: mainRow.text)
        updateRowText(&secondaryRow, with: mainRow.text)
        updateRowsArray(main: mainRow, secondRow: secondaryRow)
        tableView.reloadData()
        print("deletePressed \n")
        print("mainRow.text is \(mainRow.text)\n secondRow is \(secondaryRow.text)\n rowsArr is \(rowsArray)")
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
    }
    @IBAction func divisionBy100ButtonPressed(_ sender: Any) {
    }
    
    //MARK: - Properties
    let example = ["= 0", "- 0", "-0000000000000000", "-----------------------", "= 4", "x 2", "2", "-----------------------", "= 4","x 2", "2"]
    
    let textTableCellIdentifier = "tableCell"
    
    var rowsArray = [TableItem]()
    var mainRow = TableItem(with: "0", isMain: true)
    var secondaryRow = TableItem(with: "= ")
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        insertRowTo(array: &rowsArray, row: &mainRow, at: 0)
    }
    
}

//MARK: - Helper functions
extension ViewController {
    
    func insertRowTo(array: inout [TableItem], row: inout TableItem, at index: Int) {
        array.insert(row, at: index)
    }
    
    func updateRowText(_ row: inout TableItem, with text: String) {
        if row.text.contains("=") {
            row.text = "= " + text
        } else {
            row.text = row.text + text
        }
    }
    
    func updateRowsArray() {
        if rowsArray.count == 1 {
            rowsArray.insert(secondaryRow, at: 0)
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
    
    func defaultZero(when text: String) {
        if text == "" {
            mainRow.text = "0"
            secondaryRow.text = "= " + mainRow.text
        }
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
