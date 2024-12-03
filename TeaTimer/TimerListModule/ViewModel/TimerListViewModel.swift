//
//  TimerListViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.11.2024.
//

 
import Foundation

final class TimerListViewModel: ObservableObject {
    
    @Published var isShowLoginView = false
    @Published var isShowProfileView = false 
    @Published var isShowCreateTimer = false
}
