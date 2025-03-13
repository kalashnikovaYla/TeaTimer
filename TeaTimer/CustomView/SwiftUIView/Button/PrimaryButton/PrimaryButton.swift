//
//  PrimaryButton.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

///Тип кнопки
enum ButtonType {
    case fill
    case stroke
    case empty
}

///Основная кнопка, во всю ширину экрана. Corner radius 12
struct PrimaryButton: View {
    
    let type: ButtonType
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                /*
                 //TODO: ?
                 .font(.custom(Fonts.primary.itm,
                               size: 20)
                 )
                 */
                .foregroundColor(
                    type == .fill ?
                    Colors.inversionTxt.itm: Colors.primaryBtn.itm
                )
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .inset(by:
                    type == .fill ? 0.0 : 0.5
                  )
            .stroke(Colors.primaryBtn.itm,
                    lineWidth:
                        type == .fill || type == .empty ? 0.0 : 1
                   )
        )
        .background(type == .fill ?
                    Colors.primaryBtn.itm : Colors.primaryBg.itm)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

