public protocol CacheStorageType {
    associatedtype Key
    associatedtype Value

    subscript(key: Key) -> Value? { get set }
}

public protocol LRUCacheStorageType: CacheStorageType {
    var capacity: Int { get }
}
