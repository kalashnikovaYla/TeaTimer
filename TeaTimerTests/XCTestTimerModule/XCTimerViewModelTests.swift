//
//  XCTimerViewModelTests.swift
//  TeaTimerTests
//
//  Created by User on 13.03.2025.
//

import XCTest
@testable import TeaTimer


final class XCTimerViewModelTests: XCTestCase {

    
    func testTimerInit() {
        let vm = TimerViewModel(model: nil,
                                coordinator: Coordinator())
        XCTAssertFalse(vm.isStarted,
                       "isStarted should be false when totalSeconds is less than 0")
    }
    
    func testUpdateTimerSetsIsStartedToFalse() {
        let viewModel = TimerViewModel(model: nil,
                                       coordinator: Coordinator())
        viewModel.totalSeconds = 0
        viewModel.updateTimer()
        
        XCTAssertFalse(viewModel.isStarted,
                       "isStarted should be false when totalSeconds is less than 0")
    }
    func testUpdateTimerDoesNotSetIsStartedToFalse() {
        
        let viewModel = TimerViewModel(model: nil,
                                       coordinator: Coordinator())
        viewModel.startTimer()
        viewModel.totalSeconds = 1
        viewModel.updateTimer()
        
        
        XCTAssertTrue(viewModel.isStarted,
                      "isStarted should be true when totalSeconds is still >= 0")
    }
        
        
    func testUpdateTimerHandlesNegativeTotalSeconds() {
        
        let viewModel = TimerViewModel(model: nil,
                                       coordinator: Coordinator())
        viewModel.totalSeconds = 1
        viewModel.updateTimer()
        viewModel.updateTimer()
        
        XCTAssertFalse(viewModel.isStarted,
                       "isStarted should be false after totalSeconds goes below 0")
    }
}
