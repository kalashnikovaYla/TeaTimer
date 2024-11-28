//
//  RegistrationViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 28.11.2024.
//

import Foundation

 
final class RegistrationViewModel: ObservableObject {
   
    @Published var email = ""
    @Published var password = ""
    @Published var secondPassword = ""
    
    func registerationButtonWasTapped() {
        
    }
    
}
