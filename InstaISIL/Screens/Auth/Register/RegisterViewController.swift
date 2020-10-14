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
    
    private var registerViewModel = RegisterViewModel()
    
    override func initialize() {
        self.styleViews()
        self.setUpBackImage(self.backImageView)
    }
    
    @IBAction func register(_ sender: Any) {
        print("REGISTER called ----")
        
        self.view.endEditing(true)
        
        let name = nameUiTextField?.text ?? ""
        let lastName = lastNameUiTextField?.text ?? ""
        let email = emailUiTextField?.text ?? ""
        let password = passwordUiTextField?.text ?? ""
        
        if !name.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty {
            if name.count < 2 {
                self.showErrorDialog("El nombre ingresado debe tener como mínimo 2 caracteres")
                return
            }
            if lastName.count < 2 {
                self.showErrorDialog("El apellido ingresado debe tenr como mínimo 2 caracteres")
                return
            }
            if !email.isValidEmail(.email) {
                self.showErrorDialog("El correo ingresado no tiene un formato válido")
                return
            }
            if password.count < 4 {
                self.showErrorDialog("La contraseña debe tener como mínimo 4 caracteres")
                return
            }
            
            self.registerViewModel
                .register(credentials: UserCredentials(name: name, lastName: lastName, email: email,
                                                       password: password),
                          onSuccess: {
                            
                          }, onError: {error in
                            
                          })
            
        }
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
