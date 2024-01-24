//
//  SignInViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class SignInViewController: UIViewController, FormValidatable, ErrorNotification {
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    //MARK: - ViewControllet Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignSelf()
        button.isEnabled = false
        emailTextField.addTarget(self, action: #selector(updateButtonState), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(updateButtonState), for: .editingChanged)
        
    }
    
    //MARK: - Specific Protocol Functions
    @objc func updateButtonState() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        var isNotEnabled = errorExists(email: email, password: password, confirmationPassword: nil)
        
        if !isNotEnabled {
            let isCorrectPassword = AccountManager.isCorrectPassword(email: email, password: password)
            if !isCorrectPassword {
                showInfo(error: .incorrectPassword)
                isNotEnabled = true
            }
        }
        
        button.isEnabled = !isNotEnabled
    }
    
    //MARK: - IBActions
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        if RegistrationViewModel.userExists(email: emailTextField.text!, password: passwordTextField.text!) {
            AccountManager.logInUser(email: emailTextField.text!)
            self.performSegue(withIdentifier: Identifiers.signInToHome.rawValue, sender: self)
        } else {
            showInfo(error: .userDoesNotExists)
            button.isEnabled = false
        }
    }

}

//MARK: - UITextFieldDelegate Extension
extension SignInViewController: UITextFieldDelegate {
    func assignSelf() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState()
    }
}
