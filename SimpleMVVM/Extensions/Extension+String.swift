//
//  Extension+String.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import Foundation

extension String {
    func isValid(regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self.trimmingCharacters(in: .whitespaces)) && !self.isEmpty
    }
    
    var hashed: String {
        return String(self.hashValue)
    }
}
