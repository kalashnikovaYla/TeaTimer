//
//  CustomButton.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

///Кнопка с разными cornerRadius + stroke
struct CustomButton: View {
    
    let title: String
    var height: CGFloat?
    var imageName: String?
    let color: Color
    let strokeColor: Color
    
    let topLeftRadius: CGFloat
    let topRightRadius: CGFloat
    let bottomLeftRadius: CGFloat
    let bottomRightRadius: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 4)
            }
            
            Text(LocalizedStringKey(title))
                .padding(.trailing, 4)
        }
        .frame(maxWidth: .infinity, minHeight: height ?? 44, maxHeight: height ?? 44)
        .background(color)
        
        .overlay(RoundedCorner(radius: topRightRadius,
                                corners: [.topRight])
            .stroke(strokeColor, lineWidth: 2)
        )
        .overlay(RoundedCorner(radius: topLeftRadius,
                               corners: [.topLeft])
            .stroke(strokeColor, lineWidth: 2)
        )
        .overlay(RoundedCorner(radius: bottomLeftRadius,
                               corners: [.bottomLeft])
            .stroke(strokeColor, lineWidth: 2)
        )
        .overlay(RoundedCorner(radius: bottomRightRadius,
                               corners: [ .bottomRight])
            .stroke(strokeColor, lineWidth: 2)
        )
        
        .clipShape(RoundedCorner(radius: topRightRadius,
                                 corners: [.topRight])
        )
        .clipShape(RoundedCorner(radius: topLeftRadius,
                                 corners: [.topLeft])
        )
        .clipShape(RoundedCorner(radius: bottomLeftRadius,
                                 corners: [.bottomLeft])
        )
        .clipShape(RoundedCorner(radius: bottomRightRadius,
                                 corners: [ .bottomRight])
        )
    }
}
