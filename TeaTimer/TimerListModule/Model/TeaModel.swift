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

extension TeaModel {
    static func mock() -> TeaModel {
        return TeaModel(id: "1",
                        cName: "Зеленый чай",
                        minBrewTime: 600,
                        maxBrewTime: 5400,
                        brewingTemperature: 80,
                        numbersOfBrews: 2,
                        description: "Описание зеленого чая",
                        image: "green_tea_image")
    }
}

