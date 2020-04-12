//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftDataStructures
import XCTest

class LinkedListTests: XCTestCase {
    func testConstructor() {
        let list = LinkedList(1)
        XCTAssertEqual(list.value, 1)
        XCTAssertNil(list.next)
    }

    func testConstructorFromArray() {
        let list = LinkedList(elements: [1, 2, 3])!
        XCTAssertEqual(list.value, 1)
        XCTAssertEqual(list.next!.value, 2)
        XCTAssertEqual(list.next!.next!.value, 3)
    }

    func testEqualsFromHead() {
        let list1 = LinkedList(elements: [1, 2, 3])!
        let list2 = LinkedList(elements: [1, 2, 3])!
        XCTAssertEqual(list1, list2)
    }

    func testEqualsFromMiddle() {
        let list1 = LinkedList(elements: [1, 2, 3])!
        let list2 = LinkedList(elements: [2, 3])!
        XCTAssertEqual(list1.next, list2)
    }
}
