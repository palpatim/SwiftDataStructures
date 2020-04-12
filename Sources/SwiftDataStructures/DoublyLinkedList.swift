//
// Copyright 2020-2020 Tim Schmelter
//
// SPDX-License-Identifier: Apache-2.0
//

public final class DoublyLinkedList<Element> {
    public let value: Element
    public var prev: DoublyLinkedList<Element>?
    public var next: DoublyLinkedList<Element>?

    public var head: DoublyLinkedList<Element> {
        if let prev = prev {
            return prev.head
        }
        return self
    }

    public init(_ value: Element,
                prev: DoublyLinkedList<Element>? = nil,
                next: DoublyLinkedList<Element>? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

extension DoublyLinkedList: Equatable where Element: Equatable {
    public static func == (lhs: DoublyLinkedList<Element>, rhs: DoublyLinkedList<Element>) -> Bool {
        var isEqual = true
        var lhsCurrent: DoublyLinkedList<Element>? = lhs.head
        var rhsCurrent: DoublyLinkedList<Element>? = rhs.head

        repeat {
            isEqual = lhsCurrent?.value == rhsCurrent?.value
            lhsCurrent = lhsCurrent?.next
            rhsCurrent = rhsCurrent?.next
        } while isEqual && lhsCurrent != nil && rhsCurrent != nil

        return isEqual
    }
}

public extension DoublyLinkedList {
    convenience init?(elements: [Element]) {
        guard !elements.isEmpty else {
            return nil
        }

        self.init(elements[0])

        guard elements.count > 1 else {
            return
        }

        var current: DoublyLinkedList<Element> = self
        var prev: DoublyLinkedList<Element> = self

        for element in elements[1 ..< elements.count] {
            current = DoublyLinkedList(element)
            prev.next = current
            current.prev = prev
            prev = current
        }
    }
}
