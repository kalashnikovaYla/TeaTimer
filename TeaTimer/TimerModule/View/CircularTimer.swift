//
//  CircularTimer.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 08.12.2024.
//

import SwiftUI

struct CircularTimer: View {
    
    @StateObject var vm = CircularTimerViewModel()
    var body: some View {
        VStack(spacing: 0, content: {
            
            GeometryReader(content: { proxy in
                VStack(spacing: 15, content: {
                    
                    //MARK: Timer ring
                    ZStack {
                        Circle()
                            .stroke(Colors.primaryBorder.itm,
                                    lineWidth: 2)
                         
                        Circle()
                            .trim(from: 0, to: vm.progress)
                            .stroke(Colors.brandBg.itm,
                                    lineWidth: 2)
                            
                        
                        GeometryReader(content: { proxy in
                            let size = proxy.size
                            
                            Circle()
                                .fill(Colors.brandBorder.itm)
                                .frame(width: 12, height: 12)
                                .frame(width: size.width, height: size.width, alignment: .center)
                                .offset(x: size.height/2)
                                .rotationEffect(.init(degrees: vm.progress * 360))
                        })
                        
                        Text(vm.timerStringValue)
                            .rotationEffect(.init(degrees: 90))
                            .animation(.none, value: vm.progress)
                            
                    }
                    .padding(60)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: vm.progress)
                })
            })
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
        })
        .padding(.horizontal)
        .onTapGesture {
            vm.minute = 3
            vm.startTimer()
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if vm.isStarted {
                vm.updateTimer()
            }
        })
    }
    
}


#Preview {
    CircularTimer()
}


/*
 //MARK: NewTimerView
 
 
 NewTimerView()
     .frame(maxHeight: .infinity, alignment: .bottom)
     .offset(y: vm.addNewTimer ? 0 : 400)
 
 .overlay {
     ZStack {
         Color.black
             .opacity(vm.addNewTimer ? 0.25 : 0)
             .onTapGesture {
                 vm.addNewTimer = false
             }
     }
     .animation(.easeInOut, value: vm.addNewTimer)

 }
 @ViewBuilder
 func NewTimerView() -> some View {
     VStack(spacing: 15, content: {
         Text("Add new timer")
         
         HStack(spacing: 15, content: {
             Text("\(vm.hour) hr")
                 .padding(.horizontal, 20)
                 .padding(.vertical, 12)
                 .background {
                     Capsule()
                         .fill(.white.opacity(0.07))
                 }
             
             Text("\(vm.minute) min")
                 .padding(.horizontal, 20)
                 .padding(.vertical, 12)
                 .background {
                     Capsule()
                         .fill(.white.opacity(0.07))
                 }
             
             Text("\(vm.seconds) sec")
                 .padding(.horizontal, 20)
                 .padding(.vertical, 12)
                 .background {
                     Capsule()
                         .fill(.white.opacity(0.07))
                 }
         })
     })
     .padding()
     .frame(maxWidth: .infinity)
     .background {
         RoundedRectangle(cornerRadius: 10, style: .continuous)
             .fill(Colors.primaryBg.itm)
             .ignoresSafeArea()
     }
 }
 */
