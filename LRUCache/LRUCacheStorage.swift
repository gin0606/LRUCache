import Foundation

public struct LRUCacheStorage<K: Hashable, V>: LRUCacheStorageType {
    public typealias Key = K
    public typealias Value = V

    private(set) public var capacity: Int

    private let lock = NSLock()
    private let keys = LinkedList<K>()
    private var storage: [K:V]

    init(capacity: Int) {
        self.capacity = capacity
        self.storage = [K: V](minimumCapacity: capacity)
    }

    public subscript(key: K) -> V? {
        get {
            lock.lock()
            defer { lock.unlock() }

            guard let value = storage[key] else {
                return nil
            }
            keys.remove(element: key)
            keys.append(element: key)

            return value
        }
        set {
            lock.lock()
            defer { lock.unlock() }

            storage[key] = newValue
            keys.append(element: key)

            if storage.count > capacity, let oldest = keys.first {
                storage[oldest] = nil
                keys.remove(element: oldest)
            }
        }
    }
}
