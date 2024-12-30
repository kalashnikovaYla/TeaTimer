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
    func login() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        Task {
            do {
                let userData = try await authManager.createUser(email: email, password: password)
                print(userData)
            } catch let error {
                print("Error with sign up: \(error)")
                //The password must be 6 characters long or more.
            }
        }
    }
    
    func forgotPasswordButtonWasTapped() async throws {
        Task {
            do {
                try await authManager.resetPassword(email: email)
                 
            } catch let error {
                print("Error with sign up: \(error)")
                //The password must be 6 characters long or more.
            }
        }
    }
    
    func updatePassword() async throws {
        Task {
            do {
                try await authManager.updatePassword(password: password)
                 
            } catch let error {
                print("Error with sign up: \(error)")
                //The password must be 6 characters long or more.
            }
        }
    }
}
