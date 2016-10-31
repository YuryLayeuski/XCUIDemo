//
//  ExpenseScreen.swift
//  Depoza
//
//  Created by Yury Layeuski on 9/26/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//






import XCTest

class ExpenseScreen : BaseScreen {
    private let trashButton = XCUIApplication().navigationBars["Expense"].buttons["Trash"]
    private let deleteButton = XCUIApplication().alerts["Delete transaction?"].buttons["Delete"]
    private let editButton = XCUIApplication().navigationBars["Expense"].buttons["Edit"]
    private let doneButton = XCUIApplication().navigationBars["Expense"].buttons["Done"]
    private let dateCell = XCUIApplication().tables.cells.element(boundBy: 1)
    private let pickerWheelDate = XCUIApplication().tables.pickerWheels.element(boundBy: 0)
    private let amountCell = XCUIApplication().tables.cells.element(boundBy: 0)
    private let descriptionCell = XCUIApplication().tables.cells.element(boundBy: 3)

    
    
    override init() {
        trashButton.waitToExist()
    }
    
    func tapOnTrashButton(){
        tap(element: trashButton)
    }
    
    func tapOnDeleteButton(){
        tap(element: deleteButton)
    }
    
    func tabOnEditButton(){
        tap(element: editButton)
    }
    
    func tapOnDateCell(){
        tap(element: dateCell)
    }
    
    func selectDate(month: String, day: String) {
        pickerWheelDate.adjust(toPickerWheelValue: "\(month) \(day)")
    }
    
    func getDateFromCell() -> String {
        return dateCell.staticTexts.element(boundBy: 1).label
    }
    
    func tapOnDoneButton(){
        tap(element: doneButton)
    }
    
    
    func typeAmount(amount : String){
        type(string: amount, field: amountCell)
    }
    
    func tapOnAmountCell(){
        tap(element: amountCell)
    }
    
    func tapOnDescriptionCell(){
        tap(element: descriptionCell)
    }
}


