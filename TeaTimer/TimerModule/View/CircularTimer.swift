//
//  CircularTimer.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 08.12.2024.
//

import SwiftUI

struct CircularTimer: View {
    
    @ObservedObject var vm: TimerViewModel
    
    var body: some View {
        VStack(spacing: 0, content: {
            
            GeometryReader(content: { proxy in
                VStack(spacing: 15, content: {
                    
                    ZStack {
                        Circle()
                            .stroke(Colors.primaryBorder.itm,
                                    lineWidth: 2)
                         
                        //progress line
                        Circle()
                            .trim(from: 0, to: vm.progress)
                            .stroke(Colors.brandBg.itm,
                                    lineWidth: 2)
                            .rotationEffect(.init(degrees: -vm.progress * 360))
                        
                        GeometryReader(content: { proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Colors.brandBorder.itm)
                                .frame(width: 12, height: 12)
                                .frame(width: size.width, 
                                       height: size.width,
                                       alignment: .center)
                                .offset(x: size.height/2)
                                .rotationEffect(.init(degrees: -vm.progress * 360))
                        })
                        
                        ZStack {
                            Circle()
                                .fill(Colors.brandBg.itm)
                                .frame(width: 179, height: 179)
                            
                            Text(vm.timerStringValue)
                                .font(.custom(Fonts.bold.itm,
                                              size: 50))
                                .foregroundStyle(Colors.brandTxt.itm)
                                .rotationEffect(.init(degrees: 90))
                                .animation(.none, value: vm.progress)
                            
                        }
                       
                            
                    }
                    .padding()
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: vm.progress)
                })
            })
        })
       
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if vm.isStarted {
                vm.updateTimer()
            }
        })
        .frame(maxWidth: 258, maxHeight: 258)
    }
}


#Preview {
    @State var isStarted = true 
    @State var totalSeconds = 600
    
    return CircularTimer(vm: TimerViewModel(model: TeaModel.mock(),
                                            coordinator: Coordinator()))
}

