//
//  AutoGrowingTextView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

struct AutoGrowingTextView: View {
    
    @Binding var text: String
    let maxRows: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.brandBg.itm)
                .frame(minHeight: 40, maxHeight: (calculateHeight() + 10))
            
            TextView(text: $text)
                .frame(minHeight: 30, maxHeight: calculateHeight())
                .padding(5)
        }
    }
    
    private func calculateHeight() -> CGFloat {
        let maxTextWidth = UIScreen.main.bounds.width - 40
        
        let textHeight = ((text as NSString)
            .boundingRect(
                with: CGSize(width: maxTextWidth, height: .greatestFiniteMagnitude),
                options: .usesLineFragmentOrigin,
                context: nil)
            .height)
        
        let totalHeight = textHeight + 23
        
        if totalHeight > UIScreen.main.bounds.height * 0.7 {
            return UIScreen.main.bounds.height * 0.7
        }
        return totalHeight
    }
}
