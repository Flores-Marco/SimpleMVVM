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

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Identifiers.register, sender: self)
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Identifiers.signIn, sender: self)
    }
}

