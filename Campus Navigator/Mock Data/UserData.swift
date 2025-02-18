//
//  UserData.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-18.
//

import Foundation

struct User {
    let username: String
    let password: String
}

struct UserData {
    static let users: [User] = [
        User(username: "admin", password: "1234"),
        User(username: "cohdse222f-038", password: "user123"),
        User(username: "hdse222f-001", password: "user123")
    ]
    
    static func validateUser(username: String, password: String) -> Bool {
        return users.contains { $0.username == username && $0.password == password }
    }
}
