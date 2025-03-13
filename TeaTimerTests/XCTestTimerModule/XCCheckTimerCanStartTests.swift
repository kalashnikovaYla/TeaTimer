//
//  XCCheckTimerCanStartTests.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer


final class XCCheckTimerCanStartTests: XCTestCase {
    
    let timerVM = TimerViewModel(model: nil,
                                 coordinator: Coordinator())
    
    func testCheckTimerCanStartReturnsFalseWhenBothHourAndMinuteAreZero() { 
        let result = timerVM.checkTimerCanStart(hour: 0, minute: 0)
        XCTAssertFalse(result, 
                       "checkTimerCanStart should return false when both hour and minute are zero")
    }
    
    func testCheckTimerCanStartReturnsTrueWhenHourIsNonZero() {
        let result = timerVM.checkTimerCanStart(hour: 1, minute: 0)
        XCTAssertTrue(result,
                      "checkTimerCanStart should return true when hour is non-zero")
    }
    
    func testCheckTimerCanStartReturnsTrueWhenMinuteIsNonZero() {
        let result = timerVM.checkTimerCanStart(hour: 0, minute: 1)
        XCTAssertTrue(result,
                      "checkTimerCanStart should return true when minute is non-zero")
    }
    
    func testCheckTimerCanStartReturnsTrueWhenBothHourAndMinuteAreNonZero() {
        let result = timerVM.checkTimerCanStart(hour: 1, minute: 1)
        XCTAssertTrue(result,
                      "checkTimerCanStart should return true when both hour and minute are non-zero")
    }
}
