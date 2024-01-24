//
//  ErrorNotificationProtocol.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 23/01/24.
//

import Foundation
import UIKit

protocol ErrorNotification {
    var errorLabel: UILabel! { get }
    
    func showInfo(error: ErrorConstants?, textFieldName: String)
    func errorExists(email: String, password: String, confirmationPassword: String?) -> Bool
}

extension ErrorNotification {
    func errorExists(email: String, password: String, confirmationPassword: String?) -> Bool {
        let emailRegex = "\(Regex.name)@\(Regex.server).\(Regex.doamin)"
        let isValidEmail = email.isValid(regex: emailRegex)
        let isvalidPassword = password.isValid(regex: Regex.password)
        
        var textFieldName: String = ""
        var errorCase: ErrorConstants? = nil
        if !isValidEmail {
            textFieldName = "Email "
            errorCase = email.isEmpty ? ErrorConstants.emptyTextField : ErrorConstants.notValid
        } else if !isvalidPassword {
            textFieldName = "Password "
            errorCase = password.isEmpty ? ErrorConstants.emptyTextField : ErrorConstants.notValid
        } else if let confirmationPwd = confirmationPassword {
            if password != confirmationPwd {
                errorCase = ErrorConstants.confirmationPasswordNotEqual
            }
        }
        showInfo(error: errorCase, textFieldName: textFieldName)
        return errorCase != nil
    }
    
    func showInfo(error: ErrorConstants?, textFieldName: String = "") {
        if let error = error {
            errorLabel.text = textFieldName + error.rawValue
        } else {
            errorLabel.text = ""
        }
    }
}
