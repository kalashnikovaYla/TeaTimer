//
//  XCTimerListViewTest.swift
//  TeaTimerUITests
//
//  Created by Юлия Калашникова on 06.04.2025.
//

import XCTest

final class XCTimerListViewTest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    func testTitleExists() {
        // Проверьте, что заголовок "Timers" существует
        let title = app.staticTexts["titleTimers"]
        XCTAssertTrue(title.exists, "The title 'Timers' should exist.")
    }
    
    func testPlusButtonShowsCreateTimer() {
        let plusButton = app.buttons["plus"] 
        XCTAssertTrue(plusButton.exists, "The plus button should exist.")
        
        plusButton.tap()
        
        
        let createTimerView = app.otherElements["CreateTimerView"]
        XCTAssertTrue(createTimerView.waitForExistence(timeout: 5), "CreateTimerView не открылось")

    }
}
