//
//  MultilineTextView.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation
import SwiftUI

struct MultilineTextViewFirstResponder: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var becomeFirstResponder: Bool
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.delegate = context.coordinator
        textView.becomeFirstResponder()
        //textView.textColor = UIColor(named: "colorText04")
        //textView.tintColor = UIColor(named: "secondaryOrange")
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        if !uiView.isFirstResponder && becomeFirstResponder {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, becomeFirstResponder: $becomeFirstResponder)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        @Binding var text: String
        @Binding var becomeFirstResponder: Bool
        
        init(text: Binding<String>, becomeFirstResponder: Binding<Bool>) {
            _text = text
            _becomeFirstResponder = becomeFirstResponder
        }
        func textViewDidChange(_ textView: UITextView) {
           text = textView.text
        }
    
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
               let currentText = textView.text as NSString
               let newText = currentText.replacingCharacters(in: range, with: text)
               return newText.count <= 300
           }
    }
}
