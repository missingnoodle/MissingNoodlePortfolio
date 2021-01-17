//
//  Stack.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/16/21.
//

import Foundation

struct Stack<Element> {
    private var stack = [Element]()
    var count: Int { stack.count }
    var isEmpty: Bool { stack.isEmpty }

    mutating func push(_ element: Element) {
        stack.append(element)
    }

    mutating func pop() -> Element? {
        stack.popLast()
    }

    func peek() -> Element? {
        stack.last
    }
}

// MARK: - Initializers
extension Stack {
    init (_ items: [Element]) {
        self.stack = items
    }
}

extension Stack: ExpressibleByArrayLiteral {
    // Allows Stacks to be created using the following syntax:
    // var numbers: Stack = [1, 2, 3, 4, 5]
    init(arrayLiteral elements: Element...) {
        self.stack = elements
    }
}

// Allows for:
// let stackA = Stack([1, 2, 3])
// let stackB = Stack([1, 2, 3])
// print(stackA == stackB) , prints true
extension Stack: Equatable where Element: Equatable { }

extension Stack: Hashable where Element: Hashable { }

// More flexible than conforming to Codable
extension Stack: Decodable where Element: Decodable { }
extension Stack: Encodable where Element: Encodable { }

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        var result = "["
        var first = true

        for item in stack {
            if first {
                first = false
            } else {
                result += ", "
            }

            debugPrint(item, terminator: "", to: &result)
        }
        result += "]"
        return result
    }
}
