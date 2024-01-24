//
//  RegisterViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class RegisterViewController: UIViewController, FormValidatable, ErrorNotification {
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    // MARK: - ViewController Life Cycle
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
        let passwordConfirmation = confirmPasswordTextField.text ?? ""
        
        let isError = errorExists(email: email, password: password, confirmationPassword: passwordConfirmation)
        
        button.isEnabled = !isError
    }
    
    //MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let alreadyExists = RegistrationViewModel.userExists(email: email, password: password)
        if alreadyExists {
            showInfo(error: .userAlreadyExists)
            button.isEnabled = false
        } else {
            RegistrationViewModel.registerUser(email: email, password: password)
            AccountManager.logInUser(email: email)
            self.performSegue(withIdentifier: Identifiers.registerToHome.rawValue, sender: self)
        }
    }
}

//MARK: - UITextFieldDelegate Extension
extension RegisterViewController: UITextFieldDelegate {
    func assignSelf() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState()
    }
}
