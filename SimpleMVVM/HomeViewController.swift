//
//  HomeViewController.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var signOutButton: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signOutButton.configuration?.imagePlacement = .trailing
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
