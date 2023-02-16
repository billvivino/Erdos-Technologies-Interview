//
//  Models.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

struct UserProfile: Equatable {
    let id: String
    let firstName: String
    let lastName: String
    let emailAddress: String
    let profilePicDownloadUrl: String
    let pushNotificationToken: String
    
    static var empty = Self(id: "", firstName: "John", lastName: "Smith", emailAddress: "jsmith@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "")
}

struct UserNameAndPassWord: Equatable {
    let userName: String
    let password: String
}
