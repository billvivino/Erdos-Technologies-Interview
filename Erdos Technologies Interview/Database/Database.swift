//
//  Database.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class Database: ObservableObject {
    var validEmailsAndPassWords: [EmailAndPassword] = [
        EmailAndPassword(emailAddress: "billvivino@gmail.com", password: "123456"),
        EmailAndPassword(emailAddress: "johnsmith@gmail.com", password: "654321"),
        EmailAndPassword(emailAddress: "janedoe@gmail.com", password: "162534")
    ]
    
    var userProfiles: [UserProfile] = [
        UserProfile(id: "0", firstName: "Bill", lastName: "Vivino", emailAddress: "billvivino@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "0"),
        UserProfile(id: "1", firstName: "John", lastName: "Smith", emailAddress: "johnsmith@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "1"),
        UserProfile(id: "2", firstName: "Jane", lastName: "Doe", emailAddress: "janedoe@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "2")
    ]
    
    var userFriendsList: [String:[UserProfile]] = [
        "billvivino@gmail.com": [
            UserProfile(id: "1", firstName: "John", lastName: "Smith", emailAddress: "jsmith@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "1"),
            UserProfile(id: "2", firstName: "Jane", lastName: "Doe", emailAddress: "jdoe@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "2")
        ],
        "johnsmith@gmail.com": [
            UserProfile(id: "2", firstName: "Jane", lastName: "Doe", emailAddress: "janedoe@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "2")
        ],
        "janedoe@gmail.com": [
            UserProfile(id: "0", firstName: "Bill", lastName: "Vivino", emailAddress: "billvivino@gmail.com", profilePicDownloadUrl: "https://picsum.photos/100/100", pushNotificationToken: "0")
        ]
    ]
}
