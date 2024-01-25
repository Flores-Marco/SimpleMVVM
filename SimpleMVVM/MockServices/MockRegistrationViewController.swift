//
//  MockRegistrationViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 24/01/24.
//

import Foundation
import UIKit

class MockRegisterViewController: ErrorNotification {
    var errorLabel: UILabel!
    
    init() {
        self.errorLabel = UILabel()
    }
    
    func didRegisterWithNoError(email: String, password: String, confirmationPassword: String) -> Bool {
        return errorExists(email: email, password: password, confirmationPassword: confirmationPassword)
    }
    
}
