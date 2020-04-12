//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftDataStructures
import XCTest

class GraphTests: XCTestCase {
    func testConnectionsAreNotBidirectional() {
        let first = Graph(1)
        let second = Graph(2)
        first.add(second)

        XCTAssertEqual(first.connections.first, second)
        XCTAssertNil(second.connections.first)
    }

    func testConnectionsTraversal() {
        let first = Graph(1)
        let second = Graph(2)
        let third = Graph(3)
        first.add(second)
        second.add(third)
        XCTAssertEqual(first.connections.first?.connections.first, third)
    }

    func testReferencesAreEqual() {
        let first = Graph(1)
        let second = first
        XCTAssertEqual(first, second)
    }

    func testValuesAreNotEqual() {
        let first = Graph(1)
        let second = Graph(1)
        XCTAssertNotEqual(first, second)
    }

    func testShallowCompareValuesNoConnections() {
        let first = Graph(1)
        let second = Graph(1)
        XCTAssert(first.shallowCompareValues(second))
    }

    func testShallowCompareValuesSameConnections() {
        let first = Graph(1)
        let firstConnection = Graph(2)
        first.add(firstConnection)

        let second = Graph(1)
        let secondConnection = Graph(2)
        second.add(secondConnection)

        XCTAssert(first.shallowCompareValues(second))
    }

    func testShallowCompareValuesDifferentConnections() {
        let first = Graph(1)
        let firstConnection = Graph(2)
        first.add(firstConnection)

        let second = Graph(1)
        let secondConnection = Graph(3)
        second.add(secondConnection)

        XCTAssertFalse(first.shallowCompareValues(second))
    }

    func testConnectionForKey() {
        let first = Graph(1)
        let second = Graph(2)
        first.add(second, for: "second")

        XCTAssertEqual(first.connectionsMap["second"], second)
    }

    func testConnectToSelf() {
        let first = Graph(1)
        first.add(first)
        XCTAssertEqual(first.connections.first, first)
    }
}
