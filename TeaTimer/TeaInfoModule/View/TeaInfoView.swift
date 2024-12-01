//
//  TeaInfoView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import SwiftUI

struct TeaInfoView: View {
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 0, content: {
             
            descriptionContainer
            
            Spacer()
            PrimaryButton(type: .fill,
                          title: "Close"~)
        })
        
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var descriptionContainer: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            topContainer
            
            Image("")
                .resizable()
                .scaledToFit()
                .background(Colors.iconBtn.itm)
                .cornerRadius(20)
            
            Text("Зелёные чаи требуют бережного обращения с водой. Слишком горячая вода может сделать чай горьким. Обычно первые проливы делают короткими (около 30 секунд), затем можно увеличивать время настаивания.")
                .foregroundStyle(Colors.secondaryTxt.itm)
                .font(.custom(Fonts.primary.itm,
                              size: 17))
        })
        .padding(.horizontal)
    }
    
    private var topContainer: some View {
        VStack(alignment: .leading, spacing: 8, content: {
             BottomSheetHeader()
            
            Text("Зелёный")
                .font(.custom(Fonts.title.itm,
                              size: 24))
                .foregroundStyle(Colors.primaryTxt.itm)
            
            specifications
        })
    }
    
    private var specifications: some View {
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
    TeaInfoView()
}
