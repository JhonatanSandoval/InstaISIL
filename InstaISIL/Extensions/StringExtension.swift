//
//  StringExtension.swift
//  InstaISIL
//
//  Created by Jhonatan on 10/2/20.
//

import Foundation

extension String {
    
    enum ValidityType {
        case email
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    }
    
    func isValidEmail(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .email:
            regex = Regex.email.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
