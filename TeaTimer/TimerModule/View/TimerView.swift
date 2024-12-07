//
//  TimerView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import SwiftUI

enum StateTimerView {
    case setTimer
    case countdown
    case timeIsUp
}

struct TimerView: View {
    
    @StateObject var viewModel = TimerViewModel()
    
    @State var state: StateTimerView = .setTimer

    @State var isShowDetailView = false
    
    var body: some View {
       content
    }
    
    //MARK: - Subviews
    
    private var content: some View {
        VStack(spacing: 0) {
            TimerToolBar(type: .edit)
        
            VStack(spacing: 12, content: {
                titleContainer
                
                Characteristics()
            })
           
            switch state {
            case .setTimer:
                setTimeContainer
            case .countdown, .timeIsUp:
                countdownContainer
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Colors.primaryBg.itm
            .ignoresSafeArea(.all)
        )
        .sheet(isPresented: $isShowDetailView, content: {
            TeaInfoView()
                .presentationDetents([.large, .medium])
        })
    }
    
    private var titleContainer: some View {
        HStack {
            Text("Зеленый")
                .font(.custom(Fonts.title.itm,
                              size: 34))
                .foregroundStyle(Colors.primaryTxt.itm)
                .frame(maxWidth: .infinity, alignment: .leading)
            
           
            infoButton
        }
        .padding(.horizontal)
        .padding(.top, 7)
        .padding(.bottom, 8)
    }
    
    private var infoButton: some View {
        Button(action: {
            isShowDetailView = true 
        }, label: {
            Image("help-circle")
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
    
    private var setTimeContainer: some View {
        VStack(spacing: 0) {
             timePicker
            
             
            Button(action: {
                viewModel.beginButtonWasTappped()
            }, label: {
                PrimaryButton(type: .fill,
                              title: "Begin"~)
            })
        }
    }
    
    
    private var timePicker: some View {
        HStack {
            Picker("Часы", selection: $viewModel.selectedHour) {
                ForEach(viewModel.hours, id: \.self) { hour in
                    Text("\(hour)")
                        .tag(hour)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: 100)
            
            Picker("Минуты", selection: $viewModel.selectedMinute) {
                ForEach(viewModel.minutes, id: \.self) { minute in
                    Text(String(format: "%02d", minute))
                        .tag(minute)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(maxWidth: 100)
             
        }
        .font(.custom(Fonts.primary.itm,
                      size: 23))
        .foregroundStyle(Colors.primaryTxt.itm)
        .colorMultiply(Color.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    private var countdownContainer: some View {
        VStack {
            
        }
    }
}

#Preview {
    TimerView()
}


 
