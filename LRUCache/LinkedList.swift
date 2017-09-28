import Foundation

private class Node<V> {
    let value: V
    var next: Node<V>?
    var prev: Node<V>?

    init(value: V) {
        self.value = value
    }
}

class LinkedList<Element: Equatable> {
    private var head: Node<Element>?
    private var tail: Node<Element>?

    var first: Element? { return head?.value }

    func append(element: Element) {
        let node = Node(value: element)
        if head == nil {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail?.next = node
            self.tail = node
        }
    }

    func remove(element: Element) {
        guard let node = find(element: element) else {
            return
        }
        switch (node.prev, node.next) {
        case (nil, nil):
            self.head = nil
            self.tail = nil
        case (nil, _):
            node.next?.prev = nil
            self.head = node.next
        case (_, nil):
            node.prev?.next = nil
            self.tail = node.prev
        default:
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
    }

    func toArray() -> [Element] {
        return Array(self)
    }

    private func find(element: Element) -> Node<Element>? {
        var current = head
        while current != nil {
            defer { current = current?.next }
            if current!.value == element {
                return current
            }
        }
        return nil
    }
}

extension LinkedList: Sequence {
    struct Iterator: IteratorProtocol {
        private var current: Node<Element>?

        fileprivate init(_ current: Node<Element>?) {
            self.current = current
        }

        mutating func next() -> Element? {
            defer { current = current?.next }
            return current?.value
        }
    }

    func makeIterator() -> LinkedList<Element>.Iterator {
        return Iterator(self.head)
    }
}
