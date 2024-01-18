//
//  RegexConstants.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import Foundation

struct Regex {
    // MARK: - Email regex
    static let name = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    static let server = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    static let doamin = "[A-Za-z]{2,8}"
    
    // MARK: - Password regex
    static let password = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[!@$&#]).{8,}"
}
