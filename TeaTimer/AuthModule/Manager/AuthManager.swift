//
//  AuthManager.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 29.12.2024.
//

import Foundation
import FirebaseAuth


protocol AuthManagerProtocol {
    func checkShowSignUp() -> Bool
    func getAuthUser() throws -> AuthModel
    func createUser(email: String, password: String ) async throws -> AuthModel
}

final class AuthManager: AuthManagerProtocol {
    
    func checkShowSignUp() -> Bool {
        let authUser = try? getAuthUser()
        return authUser == nil
    }
    
    func getAuthUser() throws -> AuthModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthModel(user: user)
    }
    
    func createUser(email: String, password: String ) async throws -> AuthModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthModel(user: authDataResult.user)
    }
}
