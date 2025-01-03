//
//  TimerListView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.12.2024.
//

 
import Foundation
import SwiftUI

struct TimerListView: View {
    
    @StateObject var viewModel = TimerListViewModel()
    
    @StateObject var coordinator = Coordinator()
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
            coordinator.createLoginView()
        })
        .fullScreenCover(isPresented: $isShowRegView, content: {
            coordinator.createRegView()
        })
        .fullScreenCover(isPresented: $isShowProfileView, content: {
            coordinator.createProfileView()
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
                ForEach(viewModel.data) { model in
                    createCell(model: model)
                }
            }
        })
    }
    
    
    private func createCell(model: TeaModel) -> some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .center, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    if let name = model.cName {
                        Text(name)
                            .font(.custom(Fonts.bold.itm,
                                          size: 24))
                            .foregroundStyle(Colors.primaryTxt.itm)
                    }
                    
                    HStack(spacing: 4, content: {
                        if let sec = model.maxBrewTime {
                            let min = sec/60
                            Text("\(min) мин")
                        }
                       
                        if let temp = model.brewingTemperature {
                            Text("\(temp)° C")
                        }
                        
                    })
                    .font(.custom(Fonts.primary.itm,
                                  size: 17))
                    .foregroundStyle(Colors.secondaryTxt.itm)
                })
                .frame(maxWidth: .infinity, alignment: .leading)

                if let strUrl = model.image, let url = URL(string: strUrl) {
                    AsyncImage(url: url)
                        .frame(width: 69, height: 69)
                        .clipShape(Circle())
                }
            })
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Colors.secondaryBg.itm)
            .clipShape(RoundedCorner(radius: 16))
            .contextMenu(ContextMenu(menuItems: {
                Button("Add to favorites") {
                    viewModel.addFavoriteWasTapped(model: model)
                }
            }))
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
 
