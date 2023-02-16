//
//  HomeScreenViewModel.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    var userFriendsList: [UserProfile] = Array(repeating: .empty, count: 10)
    
    func fetchFriends() {
        
    }
}
