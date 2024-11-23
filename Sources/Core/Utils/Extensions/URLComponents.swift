import Foundation

public extension URLComponents {

    mutating func setQueryItems(with parameters: [String: String], arrayParameterName: String? = nil, arrayParameters: [String]? = nil) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let arrayParameterName = arrayParameterName, let arrayParameters = arrayParameters else { return }
        self.queryItems?.append(contentsOf: arrayParameters.map { URLQueryItem(name: arrayParameterName, value: $0)})
    }
}
