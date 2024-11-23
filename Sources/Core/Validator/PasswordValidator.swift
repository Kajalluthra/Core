import Foundation
import RegexBuilder

public class PasswordValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Result<Void, ValidationError> {
        let regEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[-!@#$%&*ˆ+=_/()?¿¡'.:,;<>])[A-Za-z0-9-!@#$%&*ˆ+=_/()?¿¡'.:,;<>]{8,}"
        guard NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: value) else {
            return .failure(.init(message: "password.format.invalid.text".localized))
        }
        return .success(())
    }
}
