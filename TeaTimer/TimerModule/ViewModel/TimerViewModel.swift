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
    @Published var timerStringValue = "00:00"
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
    
    func stopTimer() {
        withAnimation {
            isStarted = false
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringValue = "00:00"
    }
    
    func updateTimer() {
        totalSeconds -= 1
        progress = CGFloat(totalSeconds)/CGFloat(staticTotalSeconds)
        progress = progress < 0 ? 0 : progress
        let hour = totalSeconds / 3600
        let minute = (totalSeconds/60)%60
        seconds = totalSeconds % 60
        timerStringValue = "\(hour):\(minute):\(seconds)"
        
        if hour == 0 && minute == 0 && seconds == 0 {
            isStarted = false
        }
    }
    
    func beginButtonWasTapped() {
        totalSeconds = 600
        staticTotalSeconds = 600 
        isStarted = true
        state = .countdown
        
    }
    
    
}
