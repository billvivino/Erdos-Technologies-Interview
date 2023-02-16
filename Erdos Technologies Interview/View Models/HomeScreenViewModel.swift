//
//  HomeScreenViewModel.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    @Published var userFriendsList: [UserProfile] = []
    
    func fetchFriends(_ emailAddress: String, completion: @escaping(Bool)->Void) {
        API.shared.fetchFriends(emailAddress) { result in
            switch result {
            case .success(let userFriendsList):
                self.userFriendsList = userFriendsList
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
}
