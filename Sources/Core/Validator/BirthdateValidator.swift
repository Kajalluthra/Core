import Foundation

public struct BirthdateValidator: Validator {
    
    public init() {}
    
    public func validate(value: String) -> Result<Void, ValidationError> {
        let dateFormatter = DateFormatter.getSlashedShortDateFormatter()
        guard let dateToValidate = dateFormatter.date(from: value), dateToValidate < Date() else {
            return .failure(.init(message: "Date not valid."))
        }
        return .success(())
    }
}
