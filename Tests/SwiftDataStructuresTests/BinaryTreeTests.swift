//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftDataStructures
import XCTest

class BinaryTreeTests: XCTestCase {
    func testConstructor() {
        let tree = BinaryTree(1)
        XCTAssertEqual(tree.value, 1)
        XCTAssertNil(tree.left)
        XCTAssertNil(tree.right)
    }

    func testConstructorFromJSON() throws {
        let treeJSON = """
        {
            "value": 1,
            "left": {
                "value": 2
            },
            "right": {
                "value": 3
            }
        }
        """

        let tree = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)

        XCTAssertEqual(tree.value, 1)
        XCTAssertEqual(tree.left?.value, 2)
        XCTAssertEqual(tree.right?.value, 3)

        XCTAssertEqual(tree.left?.parent?.value, 1)
        XCTAssertEqual(tree.right?.parent?.value, 1)
    }

    func testEqualsSingleValue() {
        let tree1 = BinaryTree(1)
        let tree2 = BinaryTree(1)
        XCTAssertEqual(tree1, tree2)
    }

    func testEqualsTreeValues() throws {
        let treeJSON = """
        {
            "value": 1,
            "left": {
                "value": 2
            },
            "right": {
                "value": 3
            }
        }
        """

        let tree1 = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)
        let tree2 = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)

        XCTAssertEqual(tree1, tree2)
    }

    func testInOrderTraversal() throws {
        let treeJSON = """
        {
            "value": 1,
            "left": {
                "value": 2,
                "left": { "value": 4 },
                "right": { "value": 5 }
            },
            "right": {
                "value": 3
            }
        }
        """

        let tree = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)

        XCTAssertEqual(tree.traverse(.inOrder), [4, 2, 5, 1, 3])
    }

    func testPreOrderTraversal() throws {
        let treeJSON = """
        {
            "value": 1,
            "left": {
                "value": 2,
                "left": { "value": 4 },
                "right": { "value": 5 }
            },
            "right": {
                "value": 3
            }
        }
        """

        let tree = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)

        XCTAssertEqual(tree.traverse(.preOrder), [1, 2, 4, 5, 3])
    }

    func testPostOrderTraversal() throws {
        let treeJSON = """
        {
            "value": 1,
            "left": {
                "value": 2,
                "left": { "value": 4 },
                "right": { "value": 5 }
            },
            "right": {
                "value": 3
            }
        }
        """

        let tree = try BinaryTree<Int>.binaryTree(from: treeJSON.data(using: .utf8)!)

        XCTAssertEqual(tree.traverse(.postOrder), [4, 5, 2, 3, 1])
    }
}
