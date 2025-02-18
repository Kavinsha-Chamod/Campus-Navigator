//
//  AuthManager.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-18.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}

    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let isValid = UserData.validateUser(username: username, password: password)
            completion(isValid)
        }
    }
}
