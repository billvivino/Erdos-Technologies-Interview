//
//  LoginViewModel.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    var validUserNameAndPassWords: [UserNameAndPassWord] = [
        UserNameAndPassWord(userName: "billvivino", password: "123456"),
        UserNameAndPassWord(userName: "johnsmith", password: "654321")
    ]
    
    func login(userName: String, password: String, completion: @escaping(Bool)->Void) {
        if validUserNameAndPassWords.contains(where: {$0 == UserNameAndPassWord(userName: userName, password: password)}) {
            completion(true)
        } else {
            completion(false)
        }
    }
}
