//
//  XCTimerFormatterTests.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer


final class XCTimerFormatterTests: XCTestCase {
    
    let timerVM = TimerViewModel(model: nil,
                                        coordinator: Coordinator())
    
    
    func testZeroSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 0)
        XCTAssertEqual(result, "00:00", "Ожидалось '00:00' для 0 секунд")
    }
    
    // Тест для случая, когда передано отрицательное количество секунд
    func testNegativeSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: -1)
        XCTAssertEqual(result, "00:00", "Ожидалось '00:00' для отрицательных секунд")
    }
    
    // Тест для случая, когда передано 59 секунд
    func testFiftyNineSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 59)
        XCTAssertEqual(result, "00:59", "Ожидалось '00:59' для 59 секунд")
    }
    
    // Тест для случая, когда передано 60 секунд (1 минута)
    func testSixtySeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 60)
        XCTAssertEqual(result, "01:00", "Ожидалось '01:00' для 60 секунд")
    }
    
    // Тест для случая, когда передано 3600 секунд (1 час)
    func testThreeThousandSixHundredSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 3600)
        XCTAssertEqual(result, "01:00:00", "Ожидалось '01:00:00' для 3600 секунд")
    }
    
    // Тест для случая, когда передано 3661 секунда (1 час, 1 минута, 1 секунда)
    func testThreeThousandSixHundredSixtyOneSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 3661)
        XCTAssertEqual(result, "01:01:01", "Ожидалось '01:01:01' для 3661 секунды")
    }
    
    // Тест для случая, когда передано 7322 секунды (2 часа, 2 минуты, 2 секунды)
    func testSevenThousandThreeHundredTwentyTwoSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 7322)
        XCTAssertEqual(result, "02:02:02", "Ожидалось '02:02:02' для 7322 секунд")
    }
    
    // Тест для большего количества секунд
    func testLargeNumberOfSeconds() {
        let result = timerVM.formatTimerString(totalSeconds: 86399) // 23:59:59
        XCTAssertEqual(result, "23:59:59", "Ожидалось '23:59:59' для 86399 секунд")
    }
    
    // Тест для случайной большой цифры
    func testOverOneDay() {
        let result = timerVM.formatTimerString(totalSeconds: 90061) // 25:01:01
        XCTAssertEqual(result, "25:01:01", "Ожидалось '25:01:01' для 90061 секунды")
    }
}
