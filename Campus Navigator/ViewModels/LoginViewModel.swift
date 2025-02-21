//
//  LoginViewModel.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//

import Foundation

class Login {
    static func handleLogin(username: String, password: String, completion: @escaping (Bool, User?) -> Void) {
        // Check if the user exists and the password is correct
        if let user = UserData.users.first(where: { $0.username == username && $0.password == password }) {
            completion(true, user)  
        } else {
            completion(false, nil)
        }
    }
}
