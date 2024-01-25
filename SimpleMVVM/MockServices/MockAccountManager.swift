//
//  MockAccountManager.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import Foundation

class MockAccountManager {
    static func isCorrectPassword(email: String, password: String) -> Bool {
        if let userDict = MockUserDefaults.standard.searchUser(with: email) {
            return userDict["password"] == password
        }
        return false
    }
}
