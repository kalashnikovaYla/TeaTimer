//
//  LoginView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 29.12.2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @FocusState private var emailIsFocused: Bool
    @FocusState private var isPasswordFocused: Bool

    @StateObject var viewModel: LoginViewModel 
    @State var isShowRegistrationView = false
    var body: some View {
        content
    }
    
    //MARK: - Subviews
    private var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            ToolBar(type: .withDissmiss)
            titleSection
            
            inputSection
            
            Spacer()
            
            bottomButtonSection
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var inputSection: some View {
        VStack(spacing: 8) {
            
            EmailInput(email: $viewModel.email,
                       isFocused: _emailIsFocused)
            PasswordInput(type: .enterPassword,
                          password: $viewModel.password,
                          isFocused: _isPasswordFocused)
            forgotPassword
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    private var titleSection: some View {
        Text("Login")
            .font(.custom(Fonts.title.itm,
                          size: 34))
            .foregroundStyle(Colors.primaryTxt.itm)
            .padding(.horizontal)
    }
    
    private var forgotPassword: some View {
        VStack(alignment: .trailing) {
            Button(action: {
                viewModel.forgotPasswordButtonWasTapped()
            }, label: {
                Text("Forgot your password?")
                    .foregroundStyle(Colors.primaryBtn.itm)
                    .font(.custom(Fonts.primary.itm,
                                  size: 20))
            })
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var bottomButtonSection: some View {
        VStack(alignment: .center, spacing: 16, content: {
            
            Button(action: {
                viewModel.login()
            }, label: {
                PrimaryButton(type: .fill,
                              title: "Login"~)
            })
    
            registrSection
        })
    }
    
    private var registrSection: some View {
        VStack(spacing: 0) {
            Text("Are you here for the first time?")
                .font(.custom(Fonts.primary.itm,
                              size: 17))
                .foregroundStyle(Colors.secondaryTxt.itm)
            
            Button(action: {
                print("7")
                isShowRegistrationView.toggle()
            }, label: {
                Text("Registration")
                    .font(.custom(Fonts.primary.itm,
                                  size: 20))
                    .foregroundStyle(Colors.primaryBtn.itm)
            })
        }
    }
}

 
 
 
  #Preview {
      LoginView(viewModel: LoginViewModel(authManager: AuthManager()))
  }
  

 
