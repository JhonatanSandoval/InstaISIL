//
//  RegisterViewController.swift
//  InstaISIL
//
//  Created by Jhonatan on 9/25/20.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var nameUiTextField: UITextField!
    @IBOutlet weak var lastNameUiTextField: UITextField!
    @IBOutlet weak var emailUiTextField: UITextField!
    @IBOutlet weak var passwordUiTextField: UITextField!
    @IBOutlet weak var repeatPasswordUiTextField: UITextField!
    @IBOutlet weak var registerUiButton: UIButton!
    
    override func initialize() {
        self.styleViews()
        self.setUpBackImage(self.backImageView)
    }
    
    @IBAction func register(_ sender: Any) {
        print("REGISTER called ----")
    }
    
    
    private func styleViews() {
        self.nameUiTextField?.styleRoundedWithShadow()
        self.lastNameUiTextField?.styleRoundedWithShadow()
        self.emailUiTextField?.styleRoundedWithShadow()
        self.passwordUiTextField?.styleRoundedWithShadow()
        self.repeatPasswordUiTextField?.styleRoundedWithShadow()
        self.registerUiButton?.styleRoundedWithShadow()
    }
    
    
}
