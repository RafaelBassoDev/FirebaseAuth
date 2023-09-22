//
//  AuthenticationError.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 22/09/23.
//

import Foundation

enum ValidationError: Error, LocalizedError {
    case emptyUsername, emptyPassword
    case shortUsername, shortPassword
    
    public var errorDescription: String? {
        switch self {
        case .emptyUsername:
            return NSLocalizedString("Username is empty", comment: "Invalid Username")
        case .shortUsername:
            return NSLocalizedString("Username has less than 4 characters", comment: "Invalid Username")
        case .emptyPassword:
            return NSLocalizedString("Password is empty", comment: "Invalid Password")
        case .shortPassword:
            return NSLocalizedString("Password has less than 4 characters", comment: "Invalid Password")
        }
    }
}
