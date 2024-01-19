//
//  HomeViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var signOutButton: CustomButton!
    
    var email: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        signOutButton.configuration?.imagePlacement = .trailing
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        email = SessionManager.getLoggedInUser()!
        let name = email.components(separatedBy: "@")
        print(name)
        emailLabel.text = "Hello, \(name[0])"
    }
    
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        AccountManager.logOutUser(email: email)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
