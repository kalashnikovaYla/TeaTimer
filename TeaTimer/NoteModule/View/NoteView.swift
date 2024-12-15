//
//  NoteView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 15.12.2024.
//

import SwiftUI

struct NoteView: View {
    
    @StateObject var viewModel = NoteViewModel()
    
    var body: some View {
        container
    }
    
    //MARK: Subviews
    private var container: some View {
        VStack(spacing: 0, content: {
            ScrollView {
                titleContainer
                
                ForEach(0..<3) { index in
                    InfoCell()
                }
                
                TextField(text: $viewModel.text,
                          prompt: Text("Your comment").foregroundColor(Colors.thirdText.itm),
                          axis: .vertical,
                          label: {})
                    .padding(.top, 24)
                    .foregroundStyle(Colors.primaryTxt.itm)
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
            }
            
            PrimaryButton(type: .fill,
                          title: "Save"~)
        })
        .padding(.horizontal)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var titleContainer: some View {
        HStack(spacing: 12, content: {
            Image("")
                .resizable()
                .background(Color.red)
                .frame(width: 64, height: 64)
                .cornerRadius(72)
            
            VStack(alignment: .leading, spacing: 0, content: {
                Text("Зелёный")
                    .font(
                        Font.custom(Fonts.bold.itm,
                                    size: 24))
                    .kerning(0.41)
                    .foregroundColor(Colors.primaryTxt.itm)
                
                Text("Сегодня, 13:00")
                .font(Font.custom(Fonts.bold.itm,
                                  size: 17))
                .kerning(0.41)
                .foregroundColor(Colors.secondaryTxt.itm)
            })
        })
        .frame(maxWidth: .infinity, 
               alignment: .leading)
        .padding(.vertical)
    }
    
}


#Preview {
    NoteView()
}
