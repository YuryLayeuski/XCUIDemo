//
//  EditExpense.swift
//  Depoza
//
//  Created by Yury Layeuski on 10/2/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class EditExpense: BaseTest {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testEditDate() {
        let(day, month) = getFutureDate(daysFromToday: 20)
        print ("\(day), \(month)")
        
        addNewExpense()
        
        let expenses = ExpensesScreen()
        expenses.tapOnExpenseCell()

        let expenseDetailScreen = ExpenseScreen()
        expenseDetailScreen.tabOnEditButton()
        expenseDetailScreen.tapOnDateCell()
        expenseDetailScreen.selectDate(month: month, day: day)
        expenseDetailScreen.tapOnDoneButton()
        
        XCTAssert(expenseDetailScreen.getDateFromCell().contains("\(day) \(month)"), "found instead: \(expenseDetailScreen.getDateFromCell())")
    
    }

    
    func testEditAmount() {
        addNewExpense()
        
        
        let expenses = ExpensesScreen()
        expenses.tapOnExpenseCell()
    
        let expenseDetailScreen = ExpenseScreen()
        expenseDetailScreen.tabOnEditButton()
        
        app.keys["Delete"].press(forDuration: 1.5)
        
        expenseDetailScreen.typeAmount(amount: "500")
        expenseDetailScreen.tapOnDoneButton()
        sleep(3)
       
        let actual = expenses.totalExpenseAmount()
        XCTAssert(actual == "500", "Total amount is \(actual)")
        
    }
    
    
    func testEditDescription() {
        addNewExpense()
        
        let expenses = ExpensesScreen()
        expenses.tapOnExpenseCell()
    
        let expenseDetailScreen = ExpenseScreen()
        expenseDetailScreen.tabOnEditButton()
        expenseDetailScreen.tapOnDescriptionCell()
        
        let description = DescriptionScreen()
        
        description.tapOnDescriptionField()
       
        app.keyboards.keys["delete"].press(forDuration: 1.5)
        
        description.typeDescription(description: "USB")
        description.tapOnSaveButton()
        expenseDetailScreen.tapOnDoneButton()
        sleep(3)
        
        
        XCTAssert(expenses.getTextFromCell().contains("USB"))
        
            }
}





