import Foundation

public struct EmailValidator: Validator {
    
    public init() {}

    public func validate(value: String) -> Result<Void, ValidationError> {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        guard NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: value) else {
            return .failure(.init(message: "The email format is invalid"))
        }
        return .success(())
    }

}
