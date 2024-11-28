//
//  RegistrationView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//


import Foundation
import SwiftUI

struct RegistrationView: View {
   
    @FocusState private var emailIsFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isSecondaryPasswordFocused: Bool
    
    @State var viewModel = RegistrationViewModel()
    
    var body: some View {
        content
    }
    
    //MARK: Subviews
    private var content: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Registration")
            
            Text("Sign up and keep a history of your brews, mark your favorites, and write notes")
            
            VStack(spacing: 8) {
                EmailInput(email: $viewModel.email,
                           isFocused: _emailIsFocused)
                PasswordInput(password: $viewModel.password,
                              isFocused: _isPasswordFocused)
                
                PasswordInput(password: $viewModel.secondPassword,
                              isFocused: _isPasswordFocused)
            }
            
            
            Button(action: {
                viewModel.registerationButtonWasTapped()
            }, label: {
                PrimaryButton(type: .fill,
                              title: "To register"~)
            })
        
        }
    }
}
