//
//  LoginViewModel.swift
//  Campus Navigator
//
//  Created by Kavinsha 021 on 2025-02-16.
//

import Foundation

class Login {
    static func handleLogin(username: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthManager.shared.login(username: username, password: password) { success in
            completion(success)
        }
    }
}
