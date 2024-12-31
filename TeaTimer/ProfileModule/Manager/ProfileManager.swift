//
//  ProfileManager.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.12.2024.
//

import Foundation
import FirebaseFirestore
 
protocol ProfileManagerProtocol {
    func createNewUser(user: DBUser) async throws 
    func getUserId(userId: String) async throws -> DBUser
}


final class ProfileManager {
    
    private let userCollection = Firestore.firestore().collection("users")
   
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
   
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false )
    }
    
    func getUserId(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    func updateModel(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user,
                                                      merge: true)
    }
    
    func updateHistory(user: DBUser, history: [String]) async throws {
        var data: [String:Any] = [
            "history": history
        ]
        try await userDocument(userId: user.userId).updateData(data)
    }
    
    func updateFavorite(user: DBUser, favorite: [String]) async throws {
        var data: [String:Any] = [
            "favorite": favorite
        ]
        try await userDocument(userId: user.userId).updateData(data)
    }
}
