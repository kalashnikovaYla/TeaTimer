//
//  InfoCell.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 15.12.2024.
//

import SwiftUI

struct InfoCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            HStack {
                Text("1 пролив")
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                
                Text("00:15")
                   
            }
            .font(Font.custom(Fonts.primary.itm,
                              size: 17))
            .kerning(0.41)
            .foregroundColor(Colors.secondaryTxt.itm)
            
            Divider()
        })
    }
}
