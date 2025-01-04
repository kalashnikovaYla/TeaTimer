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

enum Direction {
    case up
    case down
    
}

protocol TimerViewProtocol {
    func setData(totalSeconds: Int)
}


struct TimerView: View {
    
    @StateObject var viewModel: TimerViewModel 
    
    @State var isShowNoteView = false
    @State var isShowDetailView = false
    
    var delegate: TimerViewProtocol?
    
    var body: some View {
       content
    }
    
    //MARK: - Subviews
    
    private var content: some View {
        VStack(spacing: 0) {
            TimerToolBar(type: .edit)
        
            VStack(spacing: 12, content: {
                titleContainer
                
                Characteristics(models: viewModel.coordinator.createCharacteristics())
                    .padding(.horizontal)
            })
           
            switch viewModel.state {
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
            viewModel.coordinator.createTeaInfoView()
                .presentationDetents([.large])
        })
    }
    
    private var titleContainer: some View {
        HStack {
            Text(viewModel.model?.cName ?? "")
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
                viewModel.beginButtonWasTapped()
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
        VStack(spacing: 0, content: {
            VStack(spacing: 30) {
                CircularTimer(vm: viewModel)
                    
                directionButtonSection
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            if viewModel.state == .countdown {
                countdownButtonSection
            } else {
                Button(action: {
                    isShowNoteView = true
                }, label: {
                    HistoryCell()
                })
            }
        })
    }
    
    private var directionButtonSection: some View {
        HStack(spacing: 12) {
            Button(action: {
                
            }, label: {
                CustomButton(title: "– 10 sec",
                             height: 58,
                             color: Colors.primaryBg.itm,
                             strokeColor: Colors.primaryBorder.itm,
                             topLeftRadius: 20,
                             topRightRadius: 12,
                             bottomLeftRadius: 20,
                             bottomRightRadius: 12)
                .frame(width: 110)
            })
            
            Button(action: {
                
            }, label: {
                CustomButton(title: "+ 10 sec",
                             height: 58,
                             color: Colors.primaryBg.itm,
                             strokeColor: Colors.primaryBorder.itm,
                             topLeftRadius: 12,
                             topRightRadius: 20,
                             bottomLeftRadius: 12,
                             bottomRightRadius: 20)
               
                .frame(width: 110)
                
            })
        }
        .foregroundStyle(Colors.secondaryTxt.itm)
        .font(.custom(Fonts.bold.itm,
                      size: 20))
    }
    
    
    private var countdownButtonSection: some View {
        HStack(spacing: 12, content: {
            Button(action: {
                
            }, label: {
                CustomButton(title: "Reset"~,
                             height: 58,
                             color: Colors.primaryBg.itm,
                             strokeColor: Colors.primaryBorder.itm,
                             topLeftRadius: 20,
                             topRightRadius: 12,
                             bottomLeftRadius: 20,
                             bottomRightRadius: 12)
                .foregroundStyle(Colors.secondaryTxt.itm)
            })
            
            Button(action: {
                
            }, label: {
                CustomButton(title: "Stop"~,
                             height: 58, 
                             color: Colors.primaryBtn.itm,
                             strokeColor: Colors.primaryBorder.itm,
                             topLeftRadius: 12,
                             topRightRadius: 20,
                             bottomLeftRadius: 12,
                             bottomRightRadius: 20)
                .foregroundStyle(Colors.inversionTxt.itm)
            })
        })
        .font(.custom(Fonts.bold.itm,
                      size: 20))
        
        .padding(.horizontal)
    }
}

#Preview {
    TimerView(viewModel: TimerViewModel(model: TeaModel.mock(),
                                        coordinator: Coordinator()))
}


 
