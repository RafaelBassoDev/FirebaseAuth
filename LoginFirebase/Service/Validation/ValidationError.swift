//
//  AuthenticationError.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 22/09/23.
//

import Foundation

struct ValidationError: Error, LocalizedError {    
    public enum Username: Error, LocalizedError {
        case emptyUsername
        case shortUsername
        
        public var errorDescription: String? {
            switch self {
            case .emptyUsername:
                return NSLocalizedString("Username is empty", comment: "Invalid Username")
            case .shortUsername:
                return NSLocalizedString("Username has less than 4 characters", comment: "Invalid Username")
            }
        }
    }
    
    public enum Password: Error, LocalizedError {
        case emptyPassword
        case shortPassword
        
        public var errorDescription: String? {
            switch self {
            case .emptyPassword:
                return NSLocalizedString("Password is empty", comment: "Invalid Password")
            case .shortPassword:
                return NSLocalizedString("Password has less than 4 characters", comment: "Invalid Password")
            }
        }
    }
}
