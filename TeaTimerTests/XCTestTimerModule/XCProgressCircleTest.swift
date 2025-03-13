//
//  XCProgressCircleTest.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer


final class XCProgressCircleTest: XCTestCase {
    
    let timerVM = TimerViewModel(model: nil,
                                 coordinator: Coordinator())
    
    func testProgressWithValidInput() {
        // Тестируем с валидными значениями
        let progress = timerVM.setProgress(seconds: 30, totalSeconds: 100)
        XCTAssertEqual(progress, 0.3, accuracy: 0.001)
    }
    
    func testProgressWithZeroTotalSeconds() {
        // Тестируем случай, когда totalSeconds равен 0
        let progress = timerVM.setProgress(seconds: 30, totalSeconds: 0)
        XCTAssertEqual(progress, 0.0)
    }
    
    func testProgressWithNegativeSeconds() {
        // Тестируем случай, когда seconds отрицательные
        let progress = timerVM.setProgress(seconds: -10, totalSeconds: 100)
        XCTAssertEqual(progress, 0.0, accuracy: 0.001)
    }
    
    func testProgressWithNegativeTotalSeconds() {
        // Тестируем случай, когда totalSeconds отрицательные
        let progress = timerVM.setProgress(seconds: 30, totalSeconds: -100)
        XCTAssertEqual(progress, 0.0, accuracy: 0.001)
    }
    
    func testProgressWithZeroSeconds() {
        // Тестируем случай, когда seconds равны 0
        let progress = timerVM.setProgress(seconds: 0, totalSeconds: 100)
        XCTAssertEqual(progress, 0.0, accuracy: 0.001)
    }
    
    func testProgressWithTotalSecondsLessThanSeconds() {
        // Тестируем случай, когда seconds больше totalSeconds
        let progress = timerVM.setProgress(seconds: 150, totalSeconds: 100)
        XCTAssertEqual(progress, 1.0)
    }
}
