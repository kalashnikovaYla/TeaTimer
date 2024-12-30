//
//  TimerListViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.11.2024.
//

 
import Foundation



final class TimerListViewModel: ObservableObject {
    
    @Published var authState = AuthState.notAuthenticated
    
    let authManager = AuthManager()
    let profileManager = ProfileManager()
    
    func checkAuthState() {
        
    }
}
