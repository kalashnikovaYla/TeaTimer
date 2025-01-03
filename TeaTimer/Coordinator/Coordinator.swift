//
//  Coordinator.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 03.01.2025.
//

import Foundation

protocol AppCoordinator: ObservableObject {
    func createLoginView() -> LoginView
    func createRegView() -> RegistrationView
    func createProfileView() -> ProfileView
}

final class Coordinator: AppCoordinator, ObservableObject {
     
    private let authManager: AuthManagerProtocol
    private let profileManager: ProfileManagerProtocol
    private let dbManager: DBManager
    
    @Published var authState = AuthState.notAuthenticated
    
    init() {
        self.authManager = AuthManager()
        self.profileManager = ProfileManager()
        self.dbManager = DBManager()
    }
    
    func createLoginView() -> LoginView {
        let vm = LoginViewModel(authManager: self.authManager)
        return LoginView(viewModel: vm, coordinator: self)
    }
    
    func createRegView() -> RegistrationView {
         let vm = RegistrationViewModel(authManager: self.authManager)
         return RegistrationView(viewModel: vm, coordinator: self)
    }
    
    func createProfileView() -> ProfileView {
        let vm = ProfileViewModel(authManager: authManager,
                                  profileManager: profileManager)
        return ProfileView(vm: vm)
    }
}

