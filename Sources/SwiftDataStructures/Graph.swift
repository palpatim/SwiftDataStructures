//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SwiftFoundationExtensions

public final class Graph<Element> {
    public let id: UUID
    public let value: Element
    public private(set) var connectionsMap: [AnyHashable: Graph<Element>]

    public var connections: Set<Graph<Element>> {
        Set(Array(connectionsMap.values))
    }

    public init(_ value: Element) {
        self.id = UUID()
        self.value = value
        self.connectionsMap = [AnyHashable: Graph<Element>]()
    }

    public func add(_ connection: Graph<Element>, for key: AnyHashable = UUID()) {
        connectionsMap[key] = connection
    }
}

extension Graph: Equatable {
    public static func == (lhs: Graph<Element>, rhs: Graph<Element>) -> Bool {
        lhs.id == rhs.id
    }
}

extension Graph: Hashable {
    public func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }
}

extension Graph where Element: Equatable {
    /// Evaluates equality for the values of two graph nodes, and their immediate connections
    public func shallowCompareValues(_ other: Graph<Element>) -> Bool {
        guard value == other.value else {
            return false
        }

        let connectionValues = connections.map { $0.value }
        let otherConnectionValues = other.connections.map { $0.value }

        return connectionValues.elementsEqualIgnoringOrder(otherConnectionValues)
    }
}
