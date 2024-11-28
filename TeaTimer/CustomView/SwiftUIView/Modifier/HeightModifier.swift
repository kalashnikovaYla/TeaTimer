//
//  HeightModifier.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

///Получает размер контента на view SwiftUI
struct HeightModifier: ViewModifier {
    
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
    }
}
