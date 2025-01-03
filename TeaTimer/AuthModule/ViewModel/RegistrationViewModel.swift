//
//  RegistrationViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 29.12.2024.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
   
    @Published var email = ""
    @Published var password = ""
    @Published var secondPassword = ""
   
    let authManager: AuthManagerProtocol
    let coordinator: any AppCoordinator

    init(authManager: AuthManagerProtocol, coordinator: any AppCoordinator) {
        self.authManager = authManager
        self.coordinator = coordinator
    }
    
    
    //MARK: - Methods
    func registerationButtonWasTapped() {
        guard !email.isEmpty, !password.isEmpty,
                password == secondPassword else {
            return
        }
        Task {
            do {
                let userData = try await authManager.createUser(email: email, password: password)
                await coordinator.setUser(model: userData)
                return
            } catch let error {
                checkAccountExist()
                print("Error with sign up: \(error)")
                //The password must be 6 characters long or more.
            }
        }
    }
    
    func checkAccountExist() {
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
}
