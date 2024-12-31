//
//  DBManager.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 31.12.2024.
//

import Foundation
import FirebaseFirestore

final class DBManager {
   
    private let collection = Firestore.firestore().collection("teas")
    
    func getTeas(completion: @escaping (Result<[TeaModel], Error>) -> Void) {
        collection.getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                do {
                    let teas = try snapshot?.documents.compactMap { document -> TeaModel? in
                        let tea = try document.data(as: TeaModel.self)
                        return tea
                    }
                    completion(.success(teas ?? []))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
    }
}
