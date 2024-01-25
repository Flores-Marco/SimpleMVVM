//
//  MockUserDefaults.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import Foundation

class MockUserDefaults {
    var users: Dictionary<String, [String: String]>
    static let standard: MockUserDefaults = MockUserDefaults()
    
    private init() {
        let email = "test@example.com"
        users = [
            email: ["email": email, "password": "1Ab"]
        ]
    }
    
    func searchUser(with email: String) -> [String: String]? {
        return users[email]
    }
}
