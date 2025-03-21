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
    func createTimerView() -> TimerView
    func createTeaInfoView() -> TeaInfoView
    func createCharacteristics() -> [CharacteristicsModel]
    func setUser(model: AuthModel) async
}

final class Coordinator: AppCoordinator, ObservableObject {
  
    private let authManager: AuthManagerProtocol
    private let profileManager: ProfileManagerProtocol
    private let dbManager: DBManager
    
    var selectedTea: TeaModel?
    
    
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
         let vm = RegistrationViewModel(authManager: self.authManager, coordinator: self)
         return RegistrationView(viewModel: vm)
    }
    
    func createProfileView() -> ProfileView {
        let vm = ProfileViewModel(authManager: authManager,
                                  profileManager: profileManager)
        return ProfileView(vm: vm)
    }
    
    func setUser(model: AuthModel) async {
        authState = .authenticated
        let user = DBUser(auth: model)
        try? await profileManager.createNewUser(user: user)
    }
    
    func setTeaData(model: TeaModel) {
        self.selectedTea = model
    }
    
    func createTimerView() -> TimerView {
        let vm = TimerViewModel(model: selectedTea, coordinator: self)
        return TimerView(viewModel: vm)
    }
    
    func createTeaInfoView() -> TeaInfoView {
        return TeaInfoView(model: selectedTea, 
                           coordinator: self)
    }
    
    func createCharacteristics() -> [CharacteristicsModel] {
        var characteristics: [CharacteristicsModel] = []
        
        if let brewingTemperature = selectedTea?.brewingTemperature {
            characteristics.append(CharacteristicsModel(title: "\(brewingTemperature) °C",
                                                        image: "temper"))
        }
        
        if let maxBrewTime = selectedTea?.maxBrewTime, maxBrewTime/60 > 0 {
            let min = "min"~
            characteristics.append(CharacteristicsModel(title: "\(maxBrewTime/60) \(min)",
                                                        image: "time"))
        }
        
        if let numbersOfBrews = selectedTea?.numbersOfBrews {
            characteristics.append(CharacteristicsModel(title: "\(numbersOfBrews) times"~,
                                                        image: "refresh"))
        }
        return characteristics
    }
}

