//
//  TimerListView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.11.2024.
//

import Foundation
import SwiftUI

struct TimerListView: View {
    
    @StateObject var viewModel = TimerListViewModel()
    
   
    @State var isShowCreateTimer = false
    @State var isShowLoginView = false
    @State var isShowRegView = false
    @State var isShowProfileView = false
    
    var body: some View {
        content
        
    }
    
    //MARK: - SubViews
    private var content: some View {
        VStack(spacing: 0, content: {
            ToolBar(delegate: self, type: .withLogin)
            titleContainer
            list
        })
        .background(Colors.primaryBg.itm)
        .fullScreenCover(isPresented: $isShowCreateTimer, content: {
            TimerView()
        })
        .fullScreenCover(isPresented: $isShowLoginView, content: {
            LoginView(viewModel: LoginViewModel(authManager: viewModel.authManager))
        })
        .fullScreenCover(isPresented: $isShowRegView, content: {
            RegistrationView(viewModel: RegistrationViewModel(authManager: viewModel.authManager))
        })
        .fullScreenCover(isPresented: $isShowProfileView, content: {
            ProfileView(vm: ProfileViewModel(authManager: viewModel.authManager))
        })
    }
   
    private var titleContainer: some View {
        HStack(alignment: .center, content: {
            Text("Timers")
                .font(.custom(Fonts.title.itm,
                              size: 34)
                )
                .foregroundColor(Colors.primaryTxt.itm)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: {
                isShowCreateTimer = true
            }, label: {
                plusButton
            })
        })
        .frame(height: 56)
        .padding()
    }
    
    private var plusButton: some View {
        VStack {
            Image("plus")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .frame(width: 32, height: 32)
        .background(Colors.secondaryBtn.itm)
        .clipShape(Circle())
    }
    
    
    private var list: some View {
        VStack(spacing: 0, content: {
            ScrollView {
                createCell()
            }
        })
    }
    
    
    private func createCell() -> some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .center, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Зелёный")
                        .font(.custom(Fonts.bold.itm,
                                      size: 24))
                        .foregroundStyle(Colors.primaryTxt.itm)
                    
                    HStack(spacing: 4, content: {
                        Text("3 мин")
                        Text("70-80°C")
                    })
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
                    .foregroundStyle(Colors.secondaryTxt.itm)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("")
                    .resizable()
                    .frame(width: 69, height: 69)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            })
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Colors.secondaryBg.itm)
            .clipShape(RoundedCorner(radius: 16))
            .padding(.horizontal)
        })
    }
}


//MARK: - ToolBarDelegate
extension TimerListView: ToolBarDelegate {
    func buttonWasTapped(type: ToolBarType) {
        switch type {
        case .simple, .withDissmiss:
            break
        case .withLogin:
            isShowLoginView = true
        case .withRegister:
            isShowRegView = true
        case .withProfile:
            isShowProfileView = true
        }
    }
}


 #Preview(body: {
     TimerListView()
 })
 
