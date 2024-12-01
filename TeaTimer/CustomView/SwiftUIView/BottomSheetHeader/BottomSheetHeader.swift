//
//  BottomSheetHeader.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 01.12.2024.
//

import Foundation
import SwiftUI


struct BottomSheetHeader: View {
    var body: some View {
        header
    }
    
    private var header: some View {
        VStack(alignment: .center, spacing: 12) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 32, height: 4)
                .background(Colors.icon.itm)
                .cornerRadius(100)
        }
        .frame(maxWidth: .infinity, minHeight: 24, maxHeight: 24, alignment: .center)
        
    }
}
