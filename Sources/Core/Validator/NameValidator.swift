import Foundation

public struct NameValidator: Validator {

    public init() {}
    
    public func validate(value: String) -> Result<Void, ValidationError> {
        let regEx = "^[a-zA-Z-_ ]*$"
        guard NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: value) else {
            return .failure(.init(message: "The name format is invalid"))
        }
        return .success(())
    }

}
