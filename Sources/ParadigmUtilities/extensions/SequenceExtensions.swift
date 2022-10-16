//
//  SequenceExtensions.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public extension Sequence where Element : Hashable {
    var majority : Element! {
        var counts:SequenceCounter = SequenceCounter<Element>()
        for element in self {
            counts.append(element)
        }
        return counts.maximum
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
    
    var maximum:T! {
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
