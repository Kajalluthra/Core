import Foundation

public protocol Validator {
    func validate(value: String) -> Result<Void, ValidationError>
}
