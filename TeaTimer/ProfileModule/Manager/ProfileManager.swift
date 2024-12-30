//
//  ProfileManager.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.12.2024.
//

import Foundation
import FirebaseFirestore
 
protocol ProfileManagerProtocol {
    func createNewUser(model: AuthModel) async throws
    func getUserId(userId: String) async throws -> DBUser
}

struct DBUser: Codable {
    let userId: String
    var history: [String]?
    var favorite: [String]?
}

final class ProfileManager {
    
    func createNewUser(model: AuthModel) async throws {
        var userData: [String: Any] = [
            "userId": model.uid
        ]
        
        if let email = model.email {
            userData["email"] = email
        }
        
        try await Firestore.firestore().collection("users").document(model.uid).setData(userData,
                                                                                        merge: false)
    }
    
    func getUserId(userId: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        guard let data = snapshot.data(), let id = data["userId"] else {
            throw URLError(.badServerResponse)
        }
        return DBUser(userId: userId, history: nil, favorite: nil)
    }
}
