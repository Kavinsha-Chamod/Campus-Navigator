//
//  UserData.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-18.
//

import Foundation

struct User: Equatable {
    let username: String
    let password: String
    let email: String
    let name: String
}

struct UserData {
    static let users: [User] = [
            User(username: "admin", password: "1234", email: "admin@example.com", name: "Admin User"),
            User(username: "cohdse222f-038", password: "user123", email: "user038@example.com", name: "Amal Perera"),
            User(username: "hdse222f-001", password: "user123", email: "user001@example.com", name: "User 001")
        ]
    
    static func validateUser(username: String, password: String) -> Bool {
        return users.contains { $0.username == username && $0.password == password }
    }
}
