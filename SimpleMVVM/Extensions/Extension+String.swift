//
//  Extension+String.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import Foundation

extension String {
    func isValid(regex: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
    
    var hashed: String {
        return String(self.hashValue)
    }
}
