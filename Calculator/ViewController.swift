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
    
    //MARK: Action buttons properties
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
        
        mainRow = mainRow + "0"
        secondRow = "= " + mainRow
        updateMainAndSecond(array: &rowsArray, main: mainRow, second: secondRow)
        tableView.reloadData()
        print("rowsArray is \(rowsArray) \n mainRow is \(mainRow) \n secondRow is \(secondRow)")
    }
    
    @IBAction func oneButtonPressed(_ sender: Any) {
        mainRow = mainRow + "1"
        secondRow = "= " + mainRow
        updateMainAndSecond(array: &rowsArray, main: mainRow, second: secondRow)
        tableView.reloadData()
        print("rowsArray is \(rowsArray) \n mainRow is \(mainRow) \n secondRow is \(secondRow)")
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
        rowsArray.removeAll()
        mainRow.removeAll()
        secondRow.removeAll()
        tableView.reloadData()
        print("rowsArray is \(rowsArray) \n mainRow is \(mainRow) \n secondRow is \(secondRow)")
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        rowsArray.removeAll()
        mainRow.removeAll()
        secondRow.removeAll()
        tableView.reloadData()
        print("rowsArray is \(rowsArray) \n mainRow is \(mainRow) \n secondRow is \(secondRow)")
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        mainRow.removeLast()
        secondRow.removeLast()
        clearSecondRow()
        updateMainAndSecond(array: &rowsArray, main: mainRow, second: secondRow)
        tableView.reloadData()
        print("rowsArray is \(rowsArray) \n mainRow is \(mainRow) \n secondRow is \(secondRow)")
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
    
    var mainRow: String = ""
    var secondRow: String = ""
    var initialMainRowValue = "00"
    
    
    var rowsArray: [String] = []
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        //Testing
        //        rowsArray.append(initialMainRowValue)
    }
    
}

extension ViewController {
    //MARK: - Helper functions
    func updateMainAndSecond(array: inout [String], main: String, second: String) -> [Array<String>]{
        if array.count > 1 {
            array.removeSubrange(0..<2)
        }
        array.insert(second, at: 0)
        array.insert(main, at: 1)
        
        if main.isEmpty {
            array.removeAll()
        }
        return [array]
    }
    
    func clearSecondRow() {
        if mainRow.isEmpty {
            secondRow.removeAll()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowsArray.count > 1 {
            allClearButton.isHidden = true
            clearButton.isHidden = false
        } else {
            allClearButton.isHidden = false
            clearButton.isHidden = true
        }
        
        return rowsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textTableCellIdentifier, for: indexPath ) as! TableViewCell
        
        
        
        cell.myTextLabel?.text = rowsArray[indexPath.row]
        //        if rowsArray[indexPath.row].isMainInput {
        //            cell.myTextLabel.font = UIFont.systemFont(ofSize: 56)
        //            cell.myTextLabel.textColor = UIColor.black
        //        }
        
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
}

