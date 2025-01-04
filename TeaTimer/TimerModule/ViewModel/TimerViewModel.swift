//
//  TimerViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import Foundation

final class TimerViewModel: ObservableObject {
    
    @Published var time: Date = Date()
    @Published var selectedHour: Int = 0
    @Published var selectedMinute: Int = 15
       
    let hours = Array(0...23)
    let minutes = [0, 15, 30, 45]
    
    let model: TeaModel?
    
    init(model: TeaModel?) {
        self.model = model
    }
    
    
    func beginButtonWasTappped() {
        
    }
}
