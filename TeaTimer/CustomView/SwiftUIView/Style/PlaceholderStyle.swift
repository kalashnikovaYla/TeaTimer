//
//  PlaceholderStyle.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 18.12.2024.
//

import Foundation
import SwiftUI

struct PlaceholderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Fonts.primary.itm, size: 17))
            .kerning(0.41)
            .foregroundColor(Colors.secondaryTxt.itm)
    }
}


extension View {
    func placeholderStyle() -> some View {
        self.modifier(PlaceholderStyle())
    }
}
