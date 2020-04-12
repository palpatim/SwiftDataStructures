//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftDataStructures
import XCTest

class DoublyLinkedListTests: XCTestCase {
    func testConstructor() {
        let list = DoublyLinkedList(1)
        XCTAssertEqual(list.value, 1)
        XCTAssertNil(list.next)
    }

    func testConstructorFromArray() {
        let list = DoublyLinkedList(elements: [1, 2, 3])!
        XCTAssertEqual(list.value, 1)
        XCTAssertEqual(list.next!.value, 2)
        XCTAssertEqual(list.next!.next!.value, 3)
    }

    func testHead() {
        let list = DoublyLinkedList(elements: [1, 2, 3])!
        let tail = list.next!.next!
        XCTAssertEqual(tail.head, list)
    }

    func testEqualsFromHead() {
        let list1 = DoublyLinkedList(elements: [1, 2, 3])!
        let list2 = DoublyLinkedList(elements: [1, 2, 3])!
        XCTAssertEqual(list1, list2)
    }

    func testEqualsFromMiddle() {
        let list1 = DoublyLinkedList(elements: [1, 2, 3])!
        let list2 = DoublyLinkedList(elements: [1, 2, 3])!
        XCTAssertEqual(list1.next, list2)
    }
}
