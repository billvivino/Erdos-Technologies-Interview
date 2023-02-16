//
//  API.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import Foundation

class API: ObservableObject {
    static let shared = API()
    private let database = Database()

    enum APIError: Error {
        case failedToFetch
    }
    func authenticate(_ emailAddress: String, _ password: String, completion: @escaping(Bool)->Void) {
        if database.validEmailsAndPassWords.contains(where: {$0 == EmailAndPassword(emailAddress: emailAddress, password: password)}) {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func fetchFriends(_ emailAddress: String, completion: @escaping(Result<[UserProfile], APIError>)->Void) {
        if let userFriendsList = database.userFriendsList[emailAddress] {
            completion(.success(userFriendsList))
        } else {
            completion(.failure(.failedToFetch))
        }
    }
    
    func fetchProfile(_ emailAddress: String, completion: @escaping(Result<UserProfile, APIError>)->Void) {
        if let userProfile = database.userProfiles.first(where: {$0.emailAddress == emailAddress}) {
            completion(.success(userProfile))
        } else {
            completion(.failure(.failedToFetch))
        }
    }
}
