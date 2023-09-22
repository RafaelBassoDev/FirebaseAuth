//
//  ValidationStrategy.swift
//  LoginFirebase
//
//  Created by Rafael Basso on 22/09/23.
//

import Foundation

protocol ValidationStrategy {
    func validate<T: CustomStringConvertible>(_ value: T) throws
}

struct UsernameValidationStrategy: ValidationStrategy {
    func validate<T: CustomStringConvertible>(_ value: T) throws {
        let _value = value.description
        if _value.first == nil { throw AuthError.emptyUsername }
        if _value.count < 4 { throw AuthError.shortUsername }
    }
}

struct PasswordValidationStrategy: ValidationStrategy {
    func validate<T: CustomStringConvertible>(_ value: T) throws {
        let _value = value.description
        if _value.first == nil { throw AuthError.emptyPassword }
        if _value.count < 4 { throw AuthError.shortPassword }
    }
}
