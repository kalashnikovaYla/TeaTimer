//
//  LoginModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation

struct LoginModel: Codable {
    var email: String?
    var password: Int?
}

extension LoginModel: Identifiable {
    var id: String {
        return UUID().uuidString
    }
}
