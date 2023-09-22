//
//  ValidationService.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 22/09/23.
//

import Foundation

struct ValidationService {
    
    private let usernameValidationStrategy: ValidationStrategy
    private let passwordValidationStrategy: ValidationStrategy
    
    init() {
        self.usernameValidationStrategy = UsernameValidationStrategy()
        self.passwordValidationStrategy = PasswordValidationStrategy()
    }
    
    init(
        usernameValidationStrategy: ValidationStrategy,
        passwordValidationStrategy: ValidationStrategy
    ) {
        self.usernameValidationStrategy = usernameValidationStrategy
        self.passwordValidationStrategy = passwordValidationStrategy
    }
    
    public func validateCredentials(username: String, password: String) throws {
        do {
            try usernameValidationStrategy.validate(username)
            try passwordValidationStrategy.validate(password)
        } catch {
            throw error
        }
    }
}
