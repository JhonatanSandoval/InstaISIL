//
//  UIExtension.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/2/20.
//

import UIKit

extension UIView {
    
    func styleRoundedWithShadow() {
        // corner radius
        let height = frame.size.height
        self.layer.cornerRadius = height / 2
        self.clipsToBounds = false
        
        // border
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.white.cgColor
        
        // shadow
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 1.7)
        self.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        
    }
}
