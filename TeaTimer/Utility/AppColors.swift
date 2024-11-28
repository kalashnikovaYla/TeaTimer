//
//  AppColors.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

///Перечень используемых цветов
enum Colors: String {
   
    //Background
    case brandBg
    case primaryBg
    case secondaryBg
    case thirdBg
   
    //Border
    case brandBorder
    case primaryBorder
    
    //Text
    case brandTxt
    case errorTxt
    case inversionTxt
    case secondaryTxt
    case thirdText
    
    //Icon
    case icon
    case iconBtn
   
    //Button
    case primaryHoverBtn
    case primaryBtn
    case secondaryBtn
    case secondaryHoverBtn
   

    var itm: Color {
        return Color(uiColor: UIColor(named: self.rawValue) ?? UIColor.primaryBg)
    }
}
