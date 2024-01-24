//
//  ButtonStateProtocol.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import Foundation
import UIKit

@objc protocol FormValidatable {
    var passwordTextField: UITextField! { get }
    var emailTextField: UITextField! { get }
    var button: UIButton! { get }
    
    @objc func updateButtonState()
}

