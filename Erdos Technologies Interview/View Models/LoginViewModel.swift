//
//  LoginViewModel.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn = false
    func login(userName: String, password: String, completion: @escaping()->Void) {
        API.shared.authenticate(userName, password) { success in
            if success {
                self.isLoggedIn = true
                completion()
            } else {
                self.isLoggedIn = false
                completion()
            }
        }
    }
    
    func logout() {
        self.isLoggedIn = false
    }
}
