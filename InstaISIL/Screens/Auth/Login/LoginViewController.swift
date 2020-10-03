//
//  LoginViewController.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/2/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailUiTextField: UITextField!
    @IBOutlet weak var passwordUiTextField: UITextField!
    @IBOutlet weak var loginUiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleViews()
    }
    
    private func styleViews() {
        emailUiTextField?.styleRoundedWithShadow()
        passwordUiTextField?.styleRoundedWithShadow()
        loginUiButton?.styleRoundedWithShadow()
    }
    
    @IBAction func login(_ sender: Any) {
        print("LOGIN called ---- ")
        
        self.view.endEditing(true)
        
        let email = emailUiTextField?.text ?? ""
        let password = passwordUiTextField?.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            if !email.isValidEmail(.email) {
                self.showErrorDialog("El correo ingresado no tiene un formato válido")
                return
            }
            if password.count < 4 {
                self.showErrorDialog("La contraseña debe tener como mínimo 4 caracteres")
                return
            }
            
            print("logging in ...")
            
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailUiTextField:
            passwordUiTextField?.becomeFirstResponder()
            
        case passwordUiTextField:
            self.view.endEditing(true)
            
        default:
            passwordUiTextField?.becomeFirstResponder()
        }
        
        return true
    }
    
}
