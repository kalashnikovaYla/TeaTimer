//
//  TeaModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 31.12.2024.
//

import Foundation

struct TeaModel: Codable, Identifiable {
    
    let id: String
    let cName: String?
    let minBrewTime: Int?
    let maxBrewTime: Int?
    let brewingTemperature: Int?
    let numbersOfBrews: Int?
    let description: String?
    let image: String? 
}
