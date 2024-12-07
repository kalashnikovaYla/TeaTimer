//
//  TimerToolBar.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import Foundation
import SwiftUI

enum TimerToolBarType {
    case edit
    case delete
}


struct TimerToolBar: View {
   
    let type: TimerToolBarType
    
    var body: some View {
        HStack {
            BackButton()
            
            Spacer()
            
            Button(action: {
                switch type {
                case .edit:
                    break
                case .delete:
                    break
                }
            }, label: {
                Text(type == .edit ? "Edit"~ : "Delete"~)
                    .font(.custom(Fonts.primary.itm,
                                  size: 20))
                    .foregroundStyle(Colors.primaryBtn.itm)
            })
        }
        .padding(.horizontal)
    }
}


#Preview {
    TimerToolBar(type: .edit)
}
