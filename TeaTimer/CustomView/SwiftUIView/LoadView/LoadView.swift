//
//  LoadView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI


struct LoadView: View {
    
    let text: String
    
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
                .padding(.bottom, 10)

            Text(text)
        }
        .padding(20)
        .foregroundColor(.primary)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(14)
    }
}
