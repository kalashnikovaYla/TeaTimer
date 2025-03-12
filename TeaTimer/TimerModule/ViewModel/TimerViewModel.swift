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
    let minutes = [0, 15, 30, 45]
    
    let coordinator: any AppCoordinator
    let model: TeaModel?
    
    init(model: TeaModel?, coordinator: any AppCoordinator) {
        self.model = model
        self.coordinator = coordinator
    }
    
    func startTimer() {
        
        withAnimation(.easeInOut(duration: 0.25)) {
            isStarted = true
        }
        timerStringValue = "\(seconds)"
        
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
        progress = CGFloat(totalSeconds)/CGFloat(staticTotalSeconds)
        progress = progress < 0 ? 0 : progress
        let hour = totalSeconds / 3600
        let minute = (totalSeconds/60)%60
        seconds = totalSeconds % 60
        timerStringValue = formatTimerString(totalSeconds: totalSeconds)
        
        if hour == 0 && minute == 0 && seconds == 0 {
            isStarted = false
        }
    }
    
    func beginButtonWasTapped() {
        totalSeconds = getTotalSeconds()
        timerStringValue = formatTimerString(totalSeconds: totalSeconds)
        staticTotalSeconds = 600
        isStarted = true
        state = .countdown
        
    }
    
    func getTotalSeconds() -> Int {
        let totalSeconds = (selectedHour * 3600) + (selectedMinute * 60)
        return totalSeconds
    }
    
    func stopTimer() {
        isStarted = false
    }
    
    func resumeTime() {
        isStarted = true
    }
    
    func formatTimerString(totalSeconds: Int) -> String {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    func addMinutes() {
        selectedMinute += 5
         
        if selectedMinute >= 60 {
            selectedHour += selectedMinute / 60
            selectedMinute %= 60
            
            if selectedHour >= 24 {
                selectedHour %= 24
            }
        }
        totalSeconds = getTotalSeconds()
    }
    
    func subtractMinutes() {
        selectedMinute -= 5
        
        if selectedMinute < 0 {
            selectedHour -= 1
            selectedMinute += 60
             
            if selectedHour < 0 {
                selectedHour = 23
            }
        }
        totalSeconds = getTotalSeconds()
    }
}
