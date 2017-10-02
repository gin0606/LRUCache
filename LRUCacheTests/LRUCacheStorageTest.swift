//
//  LRUCacheStorageTest.swift
//  LRUCacheTests
//
//  Created by gin0606 on 2017/09/29.
//  Copyright © 2017年 gin0606. All rights reserved.
//

import XCTest
@testable import LRUCache

class LRUCacheStorageTest: XCTestCase {
    func testGetAndSet1() {
        let cache = LRUCacheStorage<String, String>(capacity: 3)
        XCTAssertNil(cache["k1"])
    }

    func testGetAndSet2() {
        var cache = LRUCacheStorage<String, String>(capacity: 3)

        cache["k1"] = "v1"
        XCTAssertEqual(cache["k1"], "v1")

        cache["k1"] = "vv1"
        XCTAssertEqual(cache["k1"], "vv1")
    }

    func testCapacity1() {
        var cache = LRUCacheStorage<String, String>(capacity: 3)

        cache["k1"] = "v1"
        cache["k2"] = "v2"
        cache["k3"] = "v3"
        cache["k4"] = "v4"

        XCTAssertNil(cache["k1"])

        XCTAssertEqual(cache["k2"], "v2")
        XCTAssertEqual(cache["k3"], "v3")
        XCTAssertEqual(cache["k4"], "v4")
    }

    func testCapacity2() {
        var cache = LRUCacheStorage<String, String>(capacity: 3)

        cache["k1"] = "v1"
        cache["k2"] = "v2"
        cache["k3"] = "v3"

        _ = cache["k1"]

        cache["k4"] = "v4"

        XCTAssertNil(cache["k2"])

        XCTAssertEqual(cache["k1"], "v1")
        XCTAssertEqual(cache["k3"], "v3")
        XCTAssertEqual(cache["k4"], "v4")
    }
}
