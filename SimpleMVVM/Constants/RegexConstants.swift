//
//  RegexConstants.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import Foundation

struct Regex {
    // MARK: - Email regex
    static let name = "[A-Z0-9a-z._%+-]{0,30}"
    static let server = "[A-Z0-9a-z-]{0,30}"
    static let doamin = "[A-Za-z]{2,8}"
    
    // MARK: - Password regex
    static let password = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
}
