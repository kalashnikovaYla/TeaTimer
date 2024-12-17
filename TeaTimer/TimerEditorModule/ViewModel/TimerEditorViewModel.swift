//
//  TimerEditorViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 17.12.2024.
//

import Foundation

final class TimerEditorViewModel: ObservableObject {
    
    @Published var state = TimerEditorState.createNewTimer
    
    @Published var teaName = ""
    @Published var teaDescriprion = ""
    @Published var teaTmp = "" 
}
