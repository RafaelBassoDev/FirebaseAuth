//
//  CreateAccountViewModel.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 22/09/23.
//

import Foundation

class CreateAccountViewModel {
    private let validationService: ValidationService
    
    init(service validationService: ValidationService = ValidationService()) {
        self.validationService = validationService
    }
    
    public func validateCredentials(username: String, password: String) throws {
        do {
            try validationService.validateCredentials(username: username, password: password)
        } catch {
            throw error
        }
    }
}
