import UIKit

struct CountedSet<Element: Hashable> {
    private var elements = [Element : Int]()
    
    lazy var isEmpty = { count == 0 }()
    lazy var count = { elements.count }()
    
    mutating func insert(_ item: Element) {
        elements[item] = (elements[item] ?? 0) + 1
    }
    
    mutating func remove(_ item: Element) -> Int {
        elements[item] = elements[item] ?? 0 >= 1 ? (elements[item] ?? 1) - 1 : nil
        return elements[item] ?? 0
    }
    
    subscript(_ member: Element) -> Int {
        return elements[member] ?? 0
    }
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        elements.forEach { insert($0) }
    }
}
