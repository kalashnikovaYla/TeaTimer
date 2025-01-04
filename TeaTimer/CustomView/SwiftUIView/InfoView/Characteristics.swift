//
//  Characteristics.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import SwiftUI 

struct Characteristics: View {
    let models: [CharacteristicsModel]
   
    var body: some View {
        HStack(alignment: .center, content: {
            ForEach(models) { model in
                createCell(model: model)
                
                if model.id != models.last?.id {
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
    
    private func createCell(model: CharacteristicsModel) -> some View {
        VStack(spacing: 2, content: {
            if let image = model.image {
                Image(image)
                    .resizable()
                    . frame(width: 24, height: 24)
            }
           
            if let title = model.title {
                Text(title)
                    .foregroundStyle(Colors.secondaryTxt.itm)
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
            }
        })
        .frame(maxWidth: .infinity)
       
    }
}


#Preview {
    Characteristics(models: [])
}
