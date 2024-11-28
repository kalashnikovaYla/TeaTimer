//
//  LoginView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @FocusState private var emailIsFocused: Bool
    @FocusState private var isPasswordFocused: Bool

    @State var viewModel = LoginViewModel()
    
    var body: some View {
        content
    }
    
    //MARK: - Subviews
    private var content: some View {
        
        VStack(alignment: .leading, spacing: 0) {
           
            
            Text("Login")
            
            VStack(spacing: 8) {
                EmailInput(email: $viewModel.email,
                           isFocused: _emailIsFocused)
                PasswordInput(password: $viewModel.password,
                              isFocused: _isPasswordFocused)
            }
            
            forgotPassword
            Spacer()
            
            bottomButtonSection
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var forgotPassword: some View {
        VStack(alignment: .trailing) {
            Button(action: {
                viewModel.forgotPasswordButtonWasTapped()
            }, label: {
                Text("Forgot your password?")
            })
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var bottomButtonSection: some View {
        VStack(alignment: .center, spacing: 8, content: {
            
            Button(action: {
                viewModel.login()
            }, label: {
                PrimaryButton(type: .fill,
                              title: "Login"~)
            })
    
            
            
            Text("Are you here for the first time?")
            
            Button(action: {
                viewModel.isShowRegistrationView = true
            }, label: {
                Text("Registration")
            })
        })
    }
}


#Preview {
    LoginView()
}
