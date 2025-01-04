//
//  TeaInfoView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 04.01.2025.
//

import Foundation
import SwiftUI

struct TeaInfoView: View {
    
    let model: TeaModel?
    let coordinator: any AppCoordinator
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            ScrollView {
                descriptionContainer
                 
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    PrimaryButton(type: .fill,
                                  title: "Close"~)
                })
            }
           
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var descriptionContainer: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            topContainer
            
            let width = UIScreen.main.bounds.width - 40
            
            if let strUrl = model?.image, let url = URL(string: strUrl) {
                AsyncImage(url: url)
                    .frame(width: width, height: width)
                    .cornerRadius(20)
                    .scaledToFit()
            }
    
            
                Text(model?.description ?? "")
                    .foregroundStyle(Colors.secondaryTxt.itm)
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
                    .padding(.vertical)
           
        })
        .padding(.all)
    }
    
    private var topContainer: some View {
        VStack(alignment: .leading, spacing: 8, content: {
             
            Text(model?.cName ?? "")
                .font(.custom(Fonts.title.itm,
                              size: 24))
                .foregroundStyle(Colors.primaryTxt.itm)
            
            Characteristics(models: coordinator.createCharacteristics())
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
                                image: ""),
                coordinator: Coordinator())
}
