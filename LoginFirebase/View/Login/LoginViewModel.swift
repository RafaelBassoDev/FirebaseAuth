import Foundation

struct LoginViewModel {
    
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
