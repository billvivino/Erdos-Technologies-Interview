//
//  Models.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

struct UserProfile: Equatable, Hashable {
    let id: String
    let firstName: String
    let lastName: String
    let emailAddress: String
    let profilePicDownloadUrl: String
    let pushNotificationToken: String
    
    var name: String {
        "\(firstName) \(lastName)"
    }
    
    static var dummy = Self(id: "", firstName: "John", lastName: "Smith", emailAddress: "johnsmith@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "")
}

struct EmailAndPassword: Equatable {
    let emailAddress: String
    let password: String
}
