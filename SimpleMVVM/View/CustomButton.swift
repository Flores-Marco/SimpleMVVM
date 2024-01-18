//
//  CustomButton.swift
//  SimpleMVVM
//
//  Created by Marco Antonio Flores Perez on 18/01/24.
//

import UIKit

class CustomButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    private func configureButton() {
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
        
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
    }
}
