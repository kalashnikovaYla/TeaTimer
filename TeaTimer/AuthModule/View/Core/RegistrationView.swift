//
//  RegistrationView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 29.12.2024.
//

 
import Foundation
import SwiftUI

struct RegistrationView: View {
   
    @FocusState private var emailIsFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isSecondaryPasswordFocused: Bool
    
    @StateObject var viewModel: RegistrationViewModel 
    
    
    var body: some View {
        content
    }
    
    //MARK: - Subviews
    private var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            ToolBar(type: .withDissmiss)
            titleContainer
            inputContainer
            
            Spacer()
            Button(action: {
                viewModel.registerationButtonWasTapped()
            }, label: {
                PrimaryButton(type: .fill,
                              title: "To register"~)
            })
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
    }
    
    private var titleContainer: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Registration")
                .font(.custom(Fonts.title.itm,
                              size: 34))
                
            
            Text("Sign up and keep a history of your brews, mark your favorites, and write notes")
                .font(.custom(Fonts.primary.itm,
                              size: 17))
               
        }
        .foregroundStyle(Colors.secondaryTxt.itm)
        .padding(.horizontal)
        .padding(.vertical)
    }
    
    
    private var inputContainer: some View {
        VStack(spacing: 8) {
            EmailInput(email: $viewModel.email,
                       isFocused: _emailIsFocused)
            PasswordInput(type: .enterPassword,
                          password: $viewModel.password,
                          isFocused: _isPasswordFocused)
            
            PasswordInput(type: .repeatPassword,
                          password: $viewModel.secondPassword,
                          isFocused: _isPasswordFocused)
        }
        .padding(.horizontal)
    }
    
}


#Preview {
    RegistrationView(viewModel: RegistrationViewModel(authManager: AuthManager(), coordinator: Coordinator()))
}

