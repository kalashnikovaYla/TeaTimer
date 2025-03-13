//
//  XCTotalSecondsCalulateTest.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer

final class XCTotalSecondsCalulateTest: XCTestCase {
    
    let timerVM = TimerViewModel(model: nil,
                                 coordinator: Coordinator())
    
    func testZeroHoursAndMinutes() {
        let result = timerVM.getTotalSeconds(selectedHour: 0, selectedMinute: 0)
        XCTAssertEqual(result, 0, "0 hours and 0 minutes should equal 0 seconds")
    }
    
    func testOneHourAndZeroMinutes() {
        let result = timerVM.getTotalSeconds(selectedHour: 1, selectedMinute: 0)
        XCTAssertEqual(result, 3600, "1 hour should equal 3600 seconds")
    }
    
    func testZeroHoursAndOneMinute() {
        let result = timerVM.getTotalSeconds(selectedHour: 0, selectedMinute: 1)
        XCTAssertEqual(result, 60, "1 minute should equal 60 seconds")
    }
    
    func testOneHourAndOneMinute() {
        let result = timerVM.getTotalSeconds(selectedHour: 1, selectedMinute: 1)
        XCTAssertEqual(result, 3660, "1 hour and 1 minute should equal 3660 seconds")
    }
    
    func testMultipleHoursAndMinutes() {
        let result = timerVM.getTotalSeconds(selectedHour: 2, selectedMinute: 30)
        XCTAssertEqual(result, 9000, "2 hours and 30 minutes should equal 9000 seconds")
    }
    
    func testLargeValues() {
        let result = timerVM.getTotalSeconds(selectedHour: 10, selectedMinute: 45)
        XCTAssertEqual(result, 38700, "10 hours and 45 minutes should equal 38700 seconds")
    }
}
