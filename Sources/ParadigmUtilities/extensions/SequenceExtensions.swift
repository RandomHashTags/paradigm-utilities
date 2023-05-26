//
//  SequenceExtensions.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public extension Sequence {
    func map_set<T: Hashable>(maximum_set_count: Int, _ transform: (Element) -> T) -> Set<T> {
        var set:Set<T> = Set<T>()
        set.reserveCapacity(maximum_set_count)
        for element in self {
            set.insert(transform(element))
        }
        return set
    }
}

public extension Sequence where Element : Hashable {
    var majority : Element! {
        var counts:SequenceCounter = SequenceCounter<Element>()
        for element in self {
            counts.append(element)
        }
        return counts.maximum
    }
    
    func unique_set() -> Set<Element> {
        return Set<Element>(self)
    }
    func unique() -> [Element] {
        return [Element](unique_set())
    }
}

private struct SequenceCounter<T: Hashable> {
    private var array:Set<T>
    private var counts:[T:Int]
    
    init() {
        array = Set<T>()
        counts = [T:Int]()
    }
    
    mutating func append(_ value: T) {
        if array.insert(value).inserted {
            counts[value] = 1
        } else {
            counts[value]! += 1
        }
    }
    
    var maximum : T! {
        var value:T! = nil
        var maximumCount:Int = 0
        for (element, count) in counts {
            if value == nil || count > maximumCount {
                value = element
                maximumCount = count
            }
        }
        return value
    }
}

public extension Array {
    /// - Warning: entering a negative number will result in a Index-Out-Of-Bounds crash.
    func get(_ index: Int) -> Element? {
        return index < count ? self[index] : nil
    }
    
    /// Alternative to `first!`.
    var first_nonoptional : Element {
        return self[0]
    }
    /// Alternative to `last!`.
    var last_nonoptional : Element {
        return self[count-1]
    }
}
