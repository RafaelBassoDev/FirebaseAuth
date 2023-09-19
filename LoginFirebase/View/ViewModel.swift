import Foundation

enum AuthError: Error, LocalizedError {
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

struct ViewModel {
    public func validateCredentials(username: String, password: String) throws {
        do {
            try validateUsername(username)
            try validatePassword(password)
        } catch {
            throw error
        }
    }
    
    private func validateUsername(_ username: String) throws {
        if username.first == nil { throw AuthError.emptyUsername }
        if username.count < 4 { throw AuthError.shortUsername }
    }
    
    private func validatePassword(_ password: String) throws {
        if password.first == nil { throw AuthError.emptyPassword }
        if password.count < 4 { throw AuthError.shortPassword }
    }
}
