//
//  Characteristics.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import SwiftUI 

struct Characteristics: View {
    var body: some View {
        HStack(alignment: .center, content: {
            ForEach(0..<3) { index in
                createCell(image: "temper",
                           title: "70-80°C")
                if index != 2 {
                    Rectangle()
                        .fill(Colors.primaryBorder.itm)
                        .frame(width: 1, height: 50)
                }
            }
        })
        .frame(maxWidth: .infinity, minHeight: 74, maxHeight: 74)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .inset(by: 0.5)
            .stroke(Colors.primaryBorder.itm,
                    lineWidth: 1)
        )
        .padding(.horizontal)
    }
    
    private func createCell(image: String?, title: String) -> some View {
        VStack(spacing: 2, content: {
            if let image = image {
                Image(image)
                    .resizable()
                    . frame(width: 24, height: 24)
            }
           
            
            Text(title)
                .foregroundStyle(Colors.secondaryTxt.itm)
                .font(.custom(Fonts.primary.itm,
                              size: 17))
        })
        .frame(maxWidth: .infinity)
       
    }
}


#Preview {
    Characteristics()
}
