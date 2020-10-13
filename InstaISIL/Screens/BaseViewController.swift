//
//  BaseViewController.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/12/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    let boldAttr = [NSAttributedString.Key.font: UIFont(name: "Nunito-Bold", size: 14.0)]
    let regularAttr = [NSAttributedString.Key.font: UIFont(name: "Nunito-Regular", size: 14.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    func initialize() {
        // override or do something..
    }
}

