import Foundation

open class AnyRepository<T>: Repository {
    
    public init() {}

    open func getAll() async -> Result<[T], Error> {
        fatalError("getAll needs implementation")
    }

    open func add(item: T) async -> Result<String?, Error> {
        fatalError("add needs implementation")
    }

    open func get(id: String) async -> Result<T, Error> {
        fatalError("get needs implementation")
    }

    open func remove(item: T) async -> Result<Void, Error> {
        fatalError("remove needs implementation")
    }
}
