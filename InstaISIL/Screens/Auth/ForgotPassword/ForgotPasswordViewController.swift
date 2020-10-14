//
//  ForgotPasswordViewController.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/7/20.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var forgotLabel: UILabel!
    @IBOutlet weak var emailUiTextField: UITextField!
    
    private var forgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func initialize() {
        self.setUpBackImage(self.backImageView)
        self.emailUiTextField?.styleRoundedWithShadow()
        self.setupForgotLabel()
    }
    
    @IBAction func recoveryPassword(_ sender: Any) {
        print("RECOVERY PASSWORD called -----")
        self.view?.endEditing(true)
        let email = emailUiTextField?.text ?? ""
        
        if !email.isEmpty {
            if !email.isValidEmail(.email) {
                self.showErrorDialog("El correo ingresado no tiene un formato válido")
                return
            }
            
            self.forgotPasswordViewModel
                .recovery(credentials: UserCredentials(email: email),
                          onSuccess: {
                            
                          },
                          onError: { error in
                            
                          })
            
        }
    }
    
    private func setupForgotLabel() {
        let regularText = NSAttributedString(string: "Si olvidaste tu contraseña de acceso, ingresa a tu correo electrónico para enviarte los pasos de recuperación de la misma. No olvides revisar también tus ", attributes: regularAttr as [NSAttributedString.Key : Any])
        let boldText = NSAttributedString(string: "correos no deseados", attributes: boldAttr as [NSAttributedString.Key : Any])
        
        let newString = NSMutableAttributedString()
        newString.append(regularText)
        newString.append(boldText)
        forgotLabel?.attributedText = newString
        
    }
    
}
