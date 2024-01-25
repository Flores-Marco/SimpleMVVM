//
//  MockRegistrationViewModel.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import Foundation

class MockRegistrationViewModel {
    static func userExists(email: String) -> Bool {
        if let userDict = MockUserDefaults.standard.searchUser(with: email) {
            return true
        }
        return false
    }
}
