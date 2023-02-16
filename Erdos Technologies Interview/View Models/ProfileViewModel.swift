//
//  ProfileViewModel.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile = .dummy
    
    func fetchUserProfile(emailAddress: String, completion: @escaping(Bool)->Void) {
        API.shared.fetchProfile(emailAddress) { result in
            switch result {
            case .success(let userProfile):
                self.profile = userProfile
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
}
