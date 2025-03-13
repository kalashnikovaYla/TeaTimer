//
//  TimerViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import Foundation
import SwiftUI

final class TimerViewModel: ObservableObject {
    
    @Published var time: Date = Date()
    @Published var selectedHour: Int = 0
    @Published var selectedMinute: Int = 15
    
    @Published var totalSeconds = 0
    @Published var progress: CGFloat = 1
    @Published var timerStringValue = ""
    @Published var seconds = 0
    @Published var isStarted = false
    
    @Published var staticTotalSeconds: Int = 0
    
    @Published var state: StateTimerView = .setTimer
    
    let hours = Array(0...23)
    let minutes = [0, 10, 20, 30, 40, 50]
    
    let coordinator: any AppCoordinator
    let model: TeaModel?
    
    //MARK: Init
    init(model: TeaModel?, coordinator: any AppCoordinator) {
        self.model = model
        self.coordinator = coordinator
    }
    
    //MARK: - Methods
    
    
    func startTimer() {
        if !checkTimerCanStart(hour: selectedHour, minute: selectedMinute) {
            selectedMinute = 10
        }
        withAnimation(.easeInOut(duration: 0.25)) {
            isStarted = true
        }
        timerStringValue = formatTimerString(totalSeconds: seconds)
        
        totalSeconds = seconds
        staticTotalSeconds = totalSeconds
    }
    
    func resetTimer() {
        state = .setTimer
        
        withAnimation {
            isStarted = false
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringValue = formatTimerString(totalSeconds: 0)
    }
    
    func updateTimer() {
        totalSeconds -= 1
        if totalSeconds < 0 {
            isStarted = false
            return
        }
        
        progress = setProgress(seconds: totalSeconds,
                               totalSeconds: staticTotalSeconds)
        
        timerStringValue = formatTimerString(totalSeconds: totalSeconds)
    }
    
    func getTotalSeconds(selectedHour: Int, selectedMinute: Int) -> Int {
        let totalSeconds = (selectedHour * 3600) + (selectedMinute * 60)
        return totalSeconds
    }
    
    func checkTimerCanStart(hour: Int, minute: Int) -> Bool {
        if hour == 0 && minute == 0 {
            return false
        }
        return true
    }
    
    func setProgress(seconds: Int, totalSeconds: Int) -> CGFloat {
        guard totalSeconds > 0, seconds > 0 else {
            return 0.0
        }

        if seconds > totalSeconds {
            return 1.0
        }
        let progress = CGFloat(seconds)/CGFloat(totalSeconds)
        return (progress < 0 ? 0 : progress)
    }
    
    func formatTimerString(totalSeconds: Int) -> String {
        if totalSeconds <= 0 {
            return "00:00"
        }
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    func addOrSubtractSeconds(by direction: Direction, seconds: Int) -> Int {
        let fiveMinutes = 10*60
        var newSeconds = seconds
        switch direction {
        case .up:
            newSeconds += fiveMinutes
        case .down:
            newSeconds -= fiveMinutes
        }
        return max(newSeconds,0)
    }
    
    
    //MARK: - Handle user action
    func beginButtonWasTapped() {
        totalSeconds = getTotalSeconds(selectedHour: selectedHour,
                                       selectedMinute: selectedMinute)
        timerStringValue = formatTimerString(totalSeconds: totalSeconds)
        staticTotalSeconds = 600
        isStarted = true
        state = .countdown
        
    }
    
    func changeMinutes(direction: Direction) {
        isStarted = false
        totalSeconds = addOrSubtractSeconds(by: direction, 
                                            seconds: totalSeconds)

        staticTotalSeconds = totalSeconds
        timerStringValue = formatTimerString(totalSeconds: totalSeconds)
        isStarted = true 
    }
    
    func stopTimer() {
        isStarted = false
    }
    
    func resumeTime() {
        isStarted = true
    }
}
