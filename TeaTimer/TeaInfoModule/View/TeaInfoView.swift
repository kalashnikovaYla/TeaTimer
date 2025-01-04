//
//  TeaInfoView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import SwiftUI

struct TeaInfoView: View {
    
    let model: TeaModel?
    
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
            
            Text(model?.description ?? "")
                .foregroundStyle(Colors.secondaryTxt.itm)
                .font(.custom(Fonts.primary.itm,
                              size: 17))
        })
        .padding(.all)
    }
    
    private var topContainer: some View {
        VStack(alignment: .leading, spacing: 8, content: {
             
            Text(model?.cName ?? "")
                .font(.custom(Fonts.title.itm,
                              size: 24))
                .foregroundStyle(Colors.primaryTxt.itm)
            
            Characteristics(models: [])
        })
    }
}

#Preview {
    TeaInfoView(model: TeaModel(id: "",
                                cName: "Зеленый чай",
                                minBrewTime: 600,
                                maxBrewTime: 5400,
                                brewingTemperature: 80,
                                numbersOfBrews: 2,
                                description: "",
                                image: ""))
}
