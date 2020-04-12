//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

public final class LinkedList<Element> {
    public let value: Element
    public var next: LinkedList<Element>?

    public init(_ value: Element,
                next: LinkedList<Element>? = nil) {
        self.value = value
        self.next = next
    }
}

extension LinkedList: Equatable where Element: Equatable {
    public static func == (lhs: LinkedList<Element>, rhs: LinkedList<Element>) -> Bool {
        var isEqual = true
        var lhsCurrent: LinkedList<Element>? = lhs
        var rhsCurrent: LinkedList<Element>? = rhs

        repeat {
            isEqual = lhsCurrent?.value == rhsCurrent?.value
            lhsCurrent = lhsCurrent?.next
            rhsCurrent = rhsCurrent?.next
        } while isEqual && lhsCurrent != nil && rhsCurrent != nil

        return isEqual
    }
}

public extension LinkedList {
    convenience init?(elements: [Element]) {
        guard !elements.isEmpty else {
            return nil
        }

        self.init(elements[0])

        guard elements.count > 1 else {
            return
        }

        var current: LinkedList<Element> = self
        var prev: LinkedList<Element> = self

        for element in elements[1 ..< elements.count] {
            current = LinkedList(element)
            prev.next = current
            prev = current
        }
    }
}
