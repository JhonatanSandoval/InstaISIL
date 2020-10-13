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
    
    func setUpBackImage(_ imageView: UIImageView?) {
        imageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(back(gesture:))))
        imageView?.isUserInteractionEnabled = true
    }
    
    @objc private func back(gesture: UIGestureRecognizer) {
        print("image clicked ...")
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func getBoldAttr() -> UIFont? {
        return UIFont(name: "Nunito-Bold", size: 14.0)
    }
    
    func getRegularAttr() -> UIFont? {
        return UIFont(name: "Nunito-Regular", size: 14.0)
    }
    
}
