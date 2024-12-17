//
//  CustomInputStyle.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 18.12.2024.
//

import Foundation
import SwiftUI

struct CustomInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .inset(by: 0.5)
                    .stroke(Colors.primaryBorder.itm, 
                            lineWidth: 1)
            )
    }
}


extension View {
    func customInputStyle() -> some View {
        self.modifier(CustomInputStyle())
    }
}

