//
//  UIViewControllerExtension.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/2/20.
//

import UIKit

extension UIViewController {
    
    func showErrorDialog(_ message: String) {
        let alert = UIAlertController(title: "Ocurrió un error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.default, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
