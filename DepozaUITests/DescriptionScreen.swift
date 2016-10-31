//
//  DescriptionScreen.swift
//  Depoza
//
//  Created by Yury Layeuski on 10/4/16.
//  Copyright © 2016 Ivan Magda. All rights reserved.
//

import XCTest

class DescriptionScreen : BaseScreen {

private let saveButton = XCUIApplication().navigationBars["Description"].buttons["Save"]
private let descriptionField = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element




    func tapOnSaveButton() {
        tap(element: saveButton)
    }


    func typeDescription(description : String){
        type(string: description, field: descriptionField)
    }

    func tapOnDescriptionField() {
        tap(element: descriptionField)
    }

}
