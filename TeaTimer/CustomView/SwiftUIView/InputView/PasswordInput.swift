//
//  PasswordInput.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

struct PasswordInput: View {
    
    @Binding var password: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            HStack {
                SecureField("Password", text: $password)
                    .focused($isFocused)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal, 16)
                
                
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
