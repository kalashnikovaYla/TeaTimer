//
//  TimerEditorView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 17.12.2024.
//

import SwiftUI

enum TimerEditorState {
    case createNewTimer
    case editTimer
}


struct TimerEditorView: View {
   
    @State var isShowImageView = false
    @State var isShowImagePicker = false
    @StateObject var viewModel = TimerEditorViewModel()
    
    var body: some View {
        contentView
    }
    
    //MARK: Subviews
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            titleContainer
            
            addPhotoButton
            
            inputContainer
                
        })
        .padding(.horizontal)
    }
    
    
    private var titleContainer: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            
            let title = viewModel.state == .createNewTimer ? "New timer"~ : "Editing"~
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom(Fonts.title.itm, size: 34)
                    .weight(.semibold)
                )
                .foregroundColor(Colors.primaryTxt.itm)
        })
    }
    
    
    private var addPhotoButton: some View {
        Button(action: {
            switch viewModel.state {
            case .createNewTimer:
                isShowImagePicker = true
            case .editTimer:
                isShowImageView = true
            }
        }, label: {
            VStack {
                Image("plusGray")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .frame(width: 69, height: 69)
            .background(Colors.secondaryBg.itm)
            .cornerRadius(100)
            .padding(.vertical, 20)
        })
    }
    
    private var inputContainer: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            teaNameInput
            descriptionInput
            temperatureInput
        })
    }
    
    private var teaNameInput: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            TextField(text: $viewModel.teaName,
                      prompt: Text("Tea name").foregroundColor(Colors.secondaryTxt.itm),
                      axis: .horizontal,
                      label: {})
            
            .lineLimit(1)
        })
        .customInputStyle()
    }
    
    private var descriptionInput: some View {
        TextField(text: $viewModel.teaDescriprion,
                  prompt: Text("Description").foregroundColor(Colors.secondaryTxt.itm),
                  axis: .vertical,
                  label: {})
        
        .lineLimit(4)
        .padding(12)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(Colors.primaryBorder.itm,
                        lineWidth: 1)
        )
    }
    
    private var temperatureInput: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            TextField(text: $viewModel.teaName,
                      prompt: Text("Water temperature").foregroundColor(Colors.secondaryTxt.itm),
                      axis: .horizontal,
                      label: {})
            
            .lineLimit(1)
        })
        .customInputStyle()
    }
}



#Preview {
    TimerEditorView()
}
