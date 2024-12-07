//
//  ToolBar.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import Foundation
import SwiftUI


enum ToolBarType {
    case simple
    case withLogin
    case withRegister
    case withProfile
    case withDissmiss
}


struct ToolBar: View{
    
    @State var isShowLoginView = false
    @State var isShowRegView = false
    @State var isShowProfileView = false
    @Environment(\.presentationMode) var presentationMode
    
    let type: ToolBarType
    
    var body: some View {
        HStack {
            Text("Tea Timer")
                .font(.custom(Fonts.title.itm,
                              size: 20)
                )
                .foregroundColor(Colors.primaryTxt.itm)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                switch type {
                case .simple:
                    Spacer()
                
                case .withLogin:
                    Button {
                        isShowLoginView = true
                    } label: {
                        Text("Login")
                    }
                case .withRegister:
                    Button(action: {
                        
                    }, label: {
                        Text("To register")
                    })
                case .withProfile:
                    Button {
                        isShowProfileView = true
                    } label: {
                        Text("My profile")
                    }

                case .withDissmiss:
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Home")
                    }
                }
            }
            .foregroundColor(Colors.primaryBtn.itm)
            .font(.custom(Fonts.primary.itm,
                          size: 20))
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $isShowLoginView, content: {
            LoginView()
        })
        .fullScreenCover(isPresented: $isShowRegView, content: {
            RegistrationView()
        })
        .fullScreenCover(isPresented: $isShowProfileView, content: {
            ProfileView()
        })
    }
}
