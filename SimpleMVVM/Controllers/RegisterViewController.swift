//
//  RegisterViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class RegisterViewController: UIViewController, FormValidatable {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignSelf()
        updateButtonState()
        emailTextField.addTarget(self, action: #selector(updateButtonState), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(updateButtonState), for: .editingChanged)
    }
    
    @objc func updateButtonState() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let emailRegex = "\(Regex.name)@\(Regex.server).\(Regex.doamin)"
        
        let notEmpty = !email.isEmpty && !password.isEmpty
        let isValid = email.isValid(regex: emailRegex) && password.isValid(regex: Regex.password)
        let isEnabled = notEmpty && isValid
        
        button.isEnabled = isEnabled
        button.alpha = isEnabled ? 1 : 0.7
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        RegistrationViewModel.registerUser(email: emailTextField.text!, password: passwordTextField.text!)
        AccountManager.logInUser(email: emailTextField.text!)
        
        self.performSegue(withIdentifier: Identifiers.registerToHome.rawValue, sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RegisterViewController: UITextFieldDelegate {
    func assignSelf() {
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateButtonState()
    }

}

