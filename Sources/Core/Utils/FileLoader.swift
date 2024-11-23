import Foundation
import os
import LoggerExtension

enum FileLoaderError: Error {
    case fileNotFound
    case failedToDecode
}

class FileLoader {

    static let shared = FileLoader()

    private init() {}

    func loadJSON(filename: String, bundle: Bundle = Bundle.module) throws -> Data {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            throw FileLoaderError.fileNotFound
        }

        do {
            let data = try Data(contentsOf: path)
            return data
        } catch let error {
            Logger.ui.log(level: .error, message: error.localizedDescription)
            throw FileLoaderError.failedToDecode
        }
    }
}
