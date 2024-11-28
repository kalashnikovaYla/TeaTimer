//
//  EmailInput.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI


struct EmailInput: View {
    
    @Binding var email: String
    @FocusState var isFocused: Bool

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            TextField("Enter your email", text: $email)
                .focused($isFocused)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    // Действие при нажатии "return"
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
