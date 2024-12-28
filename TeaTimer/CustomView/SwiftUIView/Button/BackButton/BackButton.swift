//
//  BackButton.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import Foundation
import SwiftUI

struct BackButton: View {
   
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            VStack(alignment: .center, content: {
                Image("greenChevron-left")
                    .resizable()
                    .frame(width: 24, height: 24)
            })
        })
    }
}
