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
    func resetPassword(email: String) async throws 
    func updatePassword(password: String) async throws 
    func logOut() throws
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
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthModel(user: authDataResult.user)
    }
    
     
    func resetPassword(email: String) async throws {
        let authUser = try getAuthUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        } 
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws  {
        guard let user = Auth.auth().currentUser else {
            return
        }
        try await user.updatePassword(to: password)
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
