//
//  LinkedListTests.swift
//  LRUCacheTests
//
//  Created by gin0606 on 2017/09/29.
//  Copyright © 2017年 gin0606. All rights reserved.
//

import XCTest
@testable import LRUCache

class LinkedListTests: XCTestCase {
    func testFirst() {
        let list = LinkedList<String>()
        XCTAssertNil(list.first)

        list.append(element: "first")
        XCTAssertEqual(list.first, "first")

        list.append(element: "second")
        XCTAssertEqual(list.first, "first")

        list.append(element: "third")
        XCTAssertEqual(list.first, "first")
    }

    func testAppend() {
        let list = LinkedList<String>()
        list.append(element: "first")
        XCTAssertEqual(list.toArray(), ["first"])

        list.append(element: "second")
        XCTAssertEqual(list.toArray(), ["first", "second"])

        list.append(element: "third")
        XCTAssertEqual(list.toArray(), ["first", "second", "third"])
    }

    func testRemove() {
        let list = LinkedList<String>()
        list.append(element: "first")
        XCTAssertEqual(list.toArray(), ["first"])

        list.remove(element: "first")
        XCTAssertEqual(list.toArray(), [])
    }

    func testRemove1() {
        let list = LinkedList<String>()
        list.append(element: "first")
        list.append(element: "second")
        list.append(element: "third")
        XCTAssertEqual(list.toArray(), ["first", "second", "third"])

        list.remove(element: "first")
        XCTAssertEqual(list.toArray(), ["second", "third"])
    }

    func testRemove2() {
        let list = LinkedList<String>()
        list.append(element: "first")

        list.append(element: "second")
        list.append(element: "third")
        XCTAssertEqual(list.toArray(), ["first", "second", "third"])

        list.remove(element: "second")
        XCTAssertEqual(list.toArray(), ["first", "third"])
    }

    func testRemove3() {
        let list = LinkedList<String>()
        list.append(element: "first")
        list.append(element: "second")
        list.append(element: "third")
        XCTAssertEqual(list.toArray(), ["first", "second", "third"])

        list.remove(element: "third")
        XCTAssertEqual(list.toArray(), ["first", "second"])
    }

    func testRemove4() {
        let list = LinkedList<String>()
        list.append(element: "first")
        list.append(element: "second")
        list.append(element: "third")
        list.append(element: "second")
        XCTAssertEqual(list.toArray(), ["first", "second", "third", "second"])

        list.remove(element: "second")
        XCTAssertEqual(list.toArray(), ["first", "third", "second"])
    }
}
