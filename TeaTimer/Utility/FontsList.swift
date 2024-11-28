//
//  FontsList.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

enum Fonts {
    
    case title
    case primary
    
    var itm: String {
        switch self {
        case .title:
            return "SourceSerif4-Regular"
        case .primary:
            return "SourceSansPro-Regular"
        }
    }
}
