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
             
            PrimaryButton(type: .fill,
                          title: "Close"~)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .padding(.all)
    }
    
    private var topContainer: some View {
        VStack(alignment: .leading, spacing: 8, content: {
             
            Text("Зелёный")
                .font(.custom(Fonts.title.itm,
                              size: 24))
                .foregroundStyle(Colors.primaryTxt.itm)
            
            Characteristics()
        })
    }
}

#Preview {
    TeaInfoView()
}
