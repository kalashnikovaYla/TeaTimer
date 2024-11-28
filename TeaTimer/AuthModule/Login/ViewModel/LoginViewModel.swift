//
//  LoginViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation

 
final class LoginViewModel: ObservableObject {
    
    @Published var email = "" 
    @Published var password = ""
    @Published var isShowRegistrationView = false 
    
    
    //MARK: Methods
    func login() {
        
    }
    
    func forgotPasswordButtonWasTapped() {
        
    }
}
