//
//  DBUser.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.12.2024.
//

import Foundation

struct DBUser: Codable {
    let userId: String
    let email: String?
    var history: [String]?
    var favorite: [String]?
    
    init(auth: AuthModel) {
        self.userId = auth.uid
        self.email = auth.email
    }
}
