//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public final class Tree<Element> {
    public let id: UUID
    public let value: Element
    public var parent: Tree<Element>?
    public private(set) var children: Set<Tree<Element>>

    public init(_ value: Element) {
        self.id = UUID()
        self.value = value
        self.children = Set<Tree<Element>>()
    }

    public func addChild(_ child: Tree<Element>) {
        children.insert(child)
    }
}

extension Tree: Equatable {
    public static func == (lhs: Tree<Element>, rhs: Tree<Element>) -> Bool {
        lhs.id == rhs.id
    }
}

extension Tree: Hashable {
    public func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}
