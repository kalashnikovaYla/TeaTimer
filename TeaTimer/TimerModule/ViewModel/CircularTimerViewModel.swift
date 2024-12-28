//
//  CircularTimerViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 08.12.2024.
//

import Foundation
import SwiftUI

final class CircularTimerViewModel: NSObject, ObservableObject {
    
    @Published var progress: CGFloat = 1
    @Published var timerStringValue = "00:00"
    
    @Published var isStarted = false
    @Published var addNewTimer = false
    @Published var hour = 0
    @Published var minute = 0
    @Published var seconds = 0 
    
    @Published var totalSeconds: Int = 0
    @Published var staticTotalSeconds: Int = 0
    
    func startTimer() {
         
        withAnimation(.easeInOut(duration: 0.25)) {
            isStarted = true
        }
        timerStringValue = "\(hour == 0 ? "" : "\(hour):\(minute):\(seconds)")"
        
        totalSeconds = (hour * 3600) + (minute * 60) + seconds
        staticTotalSeconds = totalSeconds
         
    }
    
    func stopTimer() {
        withAnimation {
            isStarted = false
            hour = 0
            minute = 0
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
        hour = totalSeconds / 3600
        minute = (totalSeconds/60)%60
        seconds = totalSeconds % 60
        timerStringValue = "\(hour):\(minute):\(seconds)"
        
        if hour == 0 && minute == 0 && seconds == 0 {
            isStarted = false
        }
    }
}
