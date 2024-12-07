//
//  BackButton.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 07.12.2024.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    var body: some View {
        VStack(alignment: .center, content: {
            Image("greenChevron-left")
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
}
