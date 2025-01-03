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
    func updateModel(user: DBUser) async throws
    func addFavorite(user: DBUser, teaId: String)
    func removeFavorite(user: DBUser, teaId: String)
}


final class ProfileManager: ProfileManagerProtocol {
    
    private let userCollection = Firestore.firestore().collection("users")
   
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private func userFavoriteCollecton(userId: String) -> CollectionReference {
        userCollection.document(userId).collection("favorite")
    }
    
    private func userHistoryCollecton(userId: String) -> CollectionReference {
        userCollection.document(userId).collection("history")
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
    
    func addHistory(userId: String, teaId: String) async throws {
        let document = userHistoryCollecton(userId: userId).document()
        let documentId = document.documentID
        let data: [String:Any] = [
            "id": documentId,
            "date": Timestamp(),
            "teaId": teaId
        ]
        try await document.setData(data, merge: false)
    }
    
    func addFavorite(user: DBUser, teaId: String) {
        let document = userHistoryCollecton(userId: user.userId).document()
        
        document.updateData(["favorite": FieldValue.arrayUnion([teaId])]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Favorite updated successfully.")
            }
        }
    }
    
    func removeFavorite(user: DBUser, teaId: String) {
        let document = userHistoryCollecton(userId: user.userId).document()
      
        document.updateData(["favorite": FieldValue.arrayRemove([teaId])]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Favorite removed successfully.")
            }
        }
    }
}

