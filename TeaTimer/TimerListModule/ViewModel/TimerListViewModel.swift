//
//  TimerListViewModel.swift
//  TeaTimer
//
//  Created by Юлия Калашникова on 30.11.2024.
//

 
import Foundation

final class TimerListViewModel: ObservableObject {
    
    @Published var data: [TeaModel] = []
    
    let authManager = AuthManager()
    let profileManager = ProfileManager()
    let dbManager = DBManager()
    
    init() {
        getData()
    }
    
    func getData() {
        dbManager.getTeas { [weak self] result in
            switch result {
            case .success(let success):
                self?.data = success
            case .failure(let error):
                print("Error with fetch teas: \(error)")
            }
        }
    }
    
    func addFavoriteWasTapped(model: TeaModel) {
        Task {
            guard let auth = try? authManager.getAuthUser(),
                  let user  = try? await profileManager.getUserId(userId: auth.uid)
            else {return}
            profileManager.addFavorite(user: user, teaId: model.id)
        }
    }
}
