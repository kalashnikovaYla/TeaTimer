//
//  CharacteristicsModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 04.01.2025.
//

import Foundation

struct CharacteristicsModel: Identifiable {
    let id = UUID().uuidString
    let title: String?
    let image: String?
}
