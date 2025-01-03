//
//  ProfileViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.12.2024.
//

import Foundation


final class ProfileViewModel: ObservableObject {
    
    let authManager: AuthManagerProtocol
    let profileManager: ProfileManagerProtocol
    
    @Published private(set) var user: DBUser? = nil
    
     
    
    init(authManager: AuthManagerProtocol, profileManager: ProfileManagerProtocol) {
        self.authManager = authManager
        self.profileManager = profileManager
    }
    
    //MARK: Methods
    func loadCurrentUser() async throws {
        let authDataResult = try authManager.getAuthUser()
        self.user = try await profileManager.getUserId(userId: authDataResult.uid)
    }
}
