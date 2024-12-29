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

protocol ToolBarDelegate {
    func buttonWasTapped(type: ToolBarType)
}

struct ToolBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var delegate: ToolBarDelegate?
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
                        delegate?.buttonWasTapped(type: .withLogin)
                    } label: {
                        Text("Login")
                    }
                case .withRegister:
                    Button(action: {
                        delegate?.buttonWasTapped(type: .withRegister)
                    }, label: {
                        Text("To register")
                    })
                case .withProfile:
                    Button {
                        delegate?.buttonWasTapped(type: .withProfile)
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
    }
}
