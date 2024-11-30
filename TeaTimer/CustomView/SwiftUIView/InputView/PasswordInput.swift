//
//  PasswordInput.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

enum PasswordInputType {
    case enterPassword
    case repeatPassword
}


struct PasswordInput: View {
    
    let type: PasswordInputType
    @Binding var password: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            
            HStack {
                SecureField(type == .enterPassword ? "Password" : "Repeat password", 
                            text: $password)
                    .focused($isFocused)
                    .padding()
                    .keyboardType(.numberPad)
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
                    .foregroundStyle(Colors.secondaryTxt.itm)
                    .cornerRadius(5)
                     
                
                
                VStack(alignment: .center) {
                    if !password.isEmpty {
                        Image("eye")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
            }
        })
        .frame(maxWidth: .infinity, minHeight: 48, maxHeight: 48)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8)
            .inset(by: 0.5)
            .stroke(Colors.brandBg.itm,
                    lineWidth: 1)
        )
    }
}
