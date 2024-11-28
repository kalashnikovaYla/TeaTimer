//
//  CommonAlert.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//


import Foundation
import SwiftUI

///Универсальный alert с background на весь экран. По дефолту, если buttonActions пустой, отображается кнопка Ok, которая дисмисит alert
struct CommonAlert: View {
    
    let title: String
    var subTitle: String? = nil
    var buttonActions: [(action: () -> Void, title: String)] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            titleSection
            buttonSection
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 16)
        .padding(.bottom, 20)
        //.background(ColorSwiftUI.commonSecondaryBackground)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16)
            .inset(by: 0.5)
            //.stroke(ColorSwiftUI.background03,
           //         lineWidth: 1)
        )
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4)
            .ignoresSafeArea(.all)
        )
    }
    
    //MARK: - Subviews
    private var titleSection: some View {
        let isHasSubtitle = !(subTitle ?? "").isEmpty
        
        return VStack(alignment: .leading, spacing: 8, content: {
            if isHasSubtitle {
                Text(LocalizedStringKey(title))
                    .font(Font.system(size: 22)
                        .weight(.semibold)
                    )
                    //.foregroundColor(ColorSwiftUI.colorText04)
                    .frame(maxWidth: .infinity,
                           alignment: .topLeading)
            } else {
                Image("exclamationMarkPoint")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            if isHasSubtitle {
                if let additionalText = subTitle {
                    Text(additionalText)
                        .font(Font.system(size: 17))
                       // .foregroundColor(ColorSwiftUI.colorText04)
                }
            } else {
                Text(LocalizedStringKey(title))
                    .font(Font.system(size: 17))
                   // .foregroundColor(ColorSwiftUI.colorText04)
            }
        })
        .padding(.horizontal)
    }
    
    private var buttonSection: some View {
        HStack(spacing: 8, content: {
            
            if buttonActions.isEmpty {
                Button(action: {
                    //Router().dismissView()
                }, label: {
                    VStack(alignment: .center) {
                        Text("Ок")
                          
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, minHeight: 52,
                           maxHeight: 52, alignment: .center)
                    //.background(ColorSwiftUI.background05)
                    .cornerRadius(12)
                })
            } else {
                ForEach(buttonActions.indices, id: \.self) { index in
                    Button(action: {
                        buttonActions[index].action()
                    }, label: {
                        
                       
                    })
                }
            }
           
        })
        .padding(.horizontal)
        .font(.system(size: 16)
            .weight(.semibold)
        )
       // .foregroundColor(ColorSwiftUI.colorText03)
    }
}

