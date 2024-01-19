//
//  RegistrationViewModel.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 19/01/24.
//

import Foundation
import CoreData
import UIKit

struct LoggedKeys {
    static let loggedIn = "loggedIn"
}

class RegistrationViewModel {
    static func registerUser(email: String, password: String) {
        let userDict = ["email": email, "password": password] as [String : String]
        UserDefaults.standard.set(userDict, forKey: email)
    }
    
    static func userExists(email: String, password: String) -> Bool {
        if let userDict = UserDefaults.standard.dictionary(forKey: email) as? [String: String] {
            return userDict["password"] == password
        }
        return false
    }
}

class AccountManager {
    static func logInUser(email: String) {
        UserDefaults.standard.set(email, forKey: LoggedKeys.loggedIn)
    }
    
    static func logOutUser(email: String) {
        UserDefaults.standard.set(nil, forKey: LoggedKeys.loggedIn)
    }
}

class SessionManager {
    static func getLoggedInUser() -> String? {
        return UserDefaults.standard.string(forKey: LoggedKeys.loggedIn)
    }
}
