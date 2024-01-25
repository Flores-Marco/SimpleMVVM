//
//  MockSignInViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import Foundation
import UIKit

class MockSignInViewController: ErrorNotification {
    var errorLabel: UILabel!
    
    init() {
        self.errorLabel = UILabel()
    }
    
    func didSignInWithNoError(email: String, password: String) -> Bool {
        var error = errorExists(email: email, password: password, confirmationPassword: nil)
        if !error {
            let isCorrect = MockAccountManager.isCorrectPassword(email: email, password: password)
            error = !isCorrect
        }
        return error
    }
    
    func signInButtonPressed(email: String, password: String) {
        
    }
}
