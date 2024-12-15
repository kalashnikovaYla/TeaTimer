//
//  HistoryCell.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 15.12.2024.
//

import SwiftUI

struct HistoryCell: View {
    
    //let data: History
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            HStack {
                Text("Сегодня, 13:00")
                    .foregroundStyle(Colors.secondaryTxt.itm)
                    .font(.custom(Fonts.bold.itm,
                                  size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
               
                noteButton
            }
            
            
            ForEach(0..<3) { index in
                InfoCell()
            }
            
        })
        .padding(20)
        .background(Colors.thirdBg.itm)
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    private var noteButton: some View {
        Button(action: {
            
        }, label: {
            HStack(spacing: 4, content: {
                Image("plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    
                Text("Note")
                    .foregroundStyle(Colors.primaryBtn.itm)
                    .font(.custom(Fonts.bold.itm,
                                  size: 20))
            })
        })
    }
  
}

#Preview {
    HistoryCell()
}
