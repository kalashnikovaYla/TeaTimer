//
//  ProfileView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 03.12.2024.
//

import Foundation
import SwiftUI

enum ProfileCellType {
    case favorites
    case history
}

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isShowHistory = false
    @State var isShowFavorites = false
    
    var body: some View {
        content
    }
    
    //MARK: SubViews
    private var content: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text("My profile")
                .foregroundStyle(Colors.primaryTxt.itm)
                .font(.custom(Fonts.title.itm,
                              size: 34))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            mailCell
             
            createCell(type: .favorites)
            createCell(type: .history)
            
           
            Spacer()
            
            PrimaryButton(type: .stroke,
                          title: "Log out of your account"~)
            
            
        })
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var mailCell: some View {
        VStack(alignment: .leading, content: {
            Text("Name@mail .ru")
                .font(.custom(Fonts.primary.itm,
                              size: 17))
                .foregroundStyle(Colors.thirdText.itm)
        })
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .leading)
        .background(Colors.secondaryBg.itm)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(Colors.primaryBorder.itm, lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.vertical, 20)
    }
    
    private func createCell(type: ProfileCellType) -> some View {
        Button(action: {
            switch type {
            case .favorites:
                isShowFavorites = true
            case .history:
                isShowHistory = true
            }
        }, label: {
            HStack(alignment: .center, spacing: 12, content: {
                Image(type == .favorites ? "heartGrn" : "fileGrn")
                    .resizable()
                    .frame(width: 24, height: 24)
               
                Text(type == .favorites ? "Favorites" : "Story")
                    .foregroundStyle(Colors.primaryTxt.itm)
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Image("chevron-right")
                    .resizable()
                    .frame(width: 24, height: 24)
                
            })
            .padding(.vertical, 12)
            .padding(.horizontal)
        })
       
    }
    
    
}


#Preview {
    ProfileView()
}
