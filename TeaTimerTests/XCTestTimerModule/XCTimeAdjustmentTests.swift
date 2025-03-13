//
//  XCTimeAdjustmentTests.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer


final class XCTimeAdjustmentTests: XCTestCase {
    
    let timerVM = TimerViewModel(model: nil,
                                 coordinator: Coordinator())
    
    func testAddFiveMinutes() {
        let initialSeconds = 100 // 1 минута 40 секунд
        let result = timerVM.addOrSubtractSeconds(by: .up,
                                                  seconds: initialSeconds)
        XCTAssertEqual(result, initialSeconds + 600) // 600 секунд = 10 минут
    }
    
    func testSubtractFiveMinutes() {
        let initialSeconds = 700 // 11 минут 40 секунд
        let result = timerVM.addOrSubtractSeconds(by: .down,
                                                  seconds: initialSeconds)
        XCTAssertEqual(result, initialSeconds - 600) // 600 секунд = 10 минут
    }
    
    func testSubtractFiveMinutesBelowZero() {
        let initialSeconds = 200 // 3 минуты 20 секунд
        let result = timerVM.addOrSubtractSeconds(by: .down,
                                                  seconds: initialSeconds)
        XCTAssertEqual(result, 0) // Не может быть отрицательного времени
    }
    
    func testZeroSecondsAddFiveMinutes() {
        let initialSeconds = 0
        let result = timerVM.addOrSubtractSeconds(by: .up,
                                                  seconds: initialSeconds)
        XCTAssertEqual(result, 600) // 10 минут добавлено к нулю
    }
    
    func testZeroSecondsSubtractFiveMinutes() {
        let initialSeconds = 0
        let result = timerVM.addOrSubtractSeconds(by: .down,
                                                  seconds: initialSeconds)
        XCTAssertEqual(result, 0) // Не может быть отрицательного времени
    }
    
    func testExactFiveMinutes() {
        let initialSeconds = 600 // Точно 10 минут
        let resultUp = timerVM.addOrSubtractSeconds(by: .up,
                                                    seconds: initialSeconds)
        let resultDown = timerVM.addOrSubtractSeconds(by: .down,
                                                      seconds: initialSeconds)
        
        XCTAssertEqual(resultUp, initialSeconds + 600) // Добавляем 10 минут
        XCTAssertEqual(resultDown, max(initialSeconds - 600, 0)) // Вычитаем 10 минут
    }
}
