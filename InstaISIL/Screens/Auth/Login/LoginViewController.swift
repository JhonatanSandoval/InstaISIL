//
//  LoginViewController.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/2/20.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailUiTextField: UITextField!
    @IBOutlet weak var passwordUiTextField: UITextField!
    @IBOutlet weak var loginUiButton: UIButton!
    @IBOutlet weak var registerUiButton: UIButton!
    
    private var loginViewModel = LoginViewModel()
    
    override func initialize() {
        self.styleViews()
        self.setupRegisterLabel()
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
            
            self.loginViewModel
                .login(credentials: UserCredentials(email: email, password: password),
                       onSucess: {
                        print("login was successfull :]")
                       },
                       onError: { error in
                        print("there was an error in the login process ... ")
                        print(error.debugDescription)
                       })
            
        }
    }
    
    private func setupRegisterLabel() {
        let stringDefault = "¿No tienes un usuario?"
        let stringToColor = "Regístrate"
        let fullString = "\(stringDefault) \(stringToColor)"
        let defaultRange = (fullString as NSString).range(of: stringDefault)
        let range = (fullString as NSString).range(of: stringToColor)
        
        let regularText = NSAttributedString(string: fullString, attributes: regularAttr as [NSAttributedString.Key : Any])
        
        let newString = NSMutableAttributedString()
        newString.append(regularText)
        newString.addAttribute(.foregroundColor, value: UIColor.init(named: "Black") as Any, range: defaultRange)
        newString.addAttribute(.foregroundColor, value: UIColor.init(named: "Primary") as Any, range: range)
        
        self.registerUiButton?.setAttributedTitle(newString, for: UIControl.State.normal)
    
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

struct Credentials {
    var email: String = ""
    var password: String = ""
}
