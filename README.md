# LRUCache
thread-safe, in-memory LRU cache

某企業選考課題でやったやつ

## Usage
```swift
var cache = LRUCacheStorage<String, String>(capacity: 3)

cache["k1"] = "v1"
cache["k2"] = "v2"
cache["k3"] = "v3"

_ = cache["k1"]

cache["k4"] = "v4"

print(cache["k2"]) // => nil

print(cache["k2"]) // => v1
print(cache["k3"]) // => v2
print(cache["k4"]) // => v4
```

### Web image cache example
```swift
class ImageCache {
    var cache = LRUCacheStorage<String, UIImage>(capacity: 10)

    func getImage(url: String, handler: (UIImage) -> Void) {
        if let image = cache[url] {
            handler(image)
        }
        downloadImage(url: url) { image in
            cache[url] = image
            handler(image)
        }
    }

    func downloadImage(url: String, handler: (UIImage) -> Void) {
        ...
    }
}
```
