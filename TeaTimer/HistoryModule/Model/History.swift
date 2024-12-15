//
//  History.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 15.12.2024.
//

import Foundation

struct History: Codable, Identifiable {
    let id = UUID().uuidString
    var time: Int?
    var note: String?
    var info: [Int]?
    
}
