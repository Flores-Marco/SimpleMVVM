//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let _ = SessionManager.getLoggedInUser() {
            self.performSegue(withIdentifier: Identifiers.welcomeToHome.rawValue, sender: self)
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Identifiers.register.rawValue, sender: self)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Identifiers.signIn.rawValue, sender: self)
    }
}

