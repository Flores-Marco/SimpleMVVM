//
//  ErrorConstants.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 23/01/24.
//

import Foundation

enum ErrorConstants: String {
    //MARK: - Registration Error
    case confirmationPasswordNotEqual = "Passwords must be equal"
    case userAlreadyExists = "User already exists"
    
    //MARK: - Sign In Error
    case userDoesNotExists = "User does not exists"
    case incorrectPassword = "Password is incorrect"
    
    //MARK: - Registration and Sign In Errors
    case emptyTextField = "must not be empty"
    case notValid = "is not valid"
}
