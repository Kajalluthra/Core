import Foundation

public protocol Repository {

    associatedtype DataType

    func getAll() async -> Result<[DataType], Error>
    func add(item: DataType) async -> Result<String?, Error>
    func get(id: String) async -> Result<DataType, Error>
    func remove(item: DataType) async -> Result<Void, Error>
}
