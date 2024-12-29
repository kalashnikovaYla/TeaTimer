//
//  LoginViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 29.12.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isShowRegistrationView = false
    
    let authManager: AuthManagerProtocol
    
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }
    
    
    //MARK: Methods
    func login() {
        
    }
    
    func forgotPasswordButtonWasTapped() {
        
    }
}
