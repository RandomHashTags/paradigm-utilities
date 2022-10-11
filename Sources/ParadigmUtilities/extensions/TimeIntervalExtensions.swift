//
//  TimeIntervalExtensions.swift
//
//
//  Created by Evan Anderson on 7/19/22.
//

import Foundation

public extension TimeInterval {
    static func minutes(_ input: Int) -> TimeInterval {
        return minutes(Double(input))
    }
    static func hours(_ input: Int) -> TimeInterval {
        return hours(Double(input))
    }
    static func days(_ input: Int) -> TimeInterval {
        return days(Double(input))
    }
    static func weeks(_ input: Int) -> TimeInterval {
        return weeks(Double(input))
    }
    static func months(_ input: Int) -> TimeInterval {
        return months(Double(input))
    }
    
    static func minutes(_ input: Double) -> TimeInterval {
        return input * 60
    }
    static func hours(_ input: Double) -> TimeInterval {
        return minutes(input) * 60
    }
    static func days(_ input: Double) -> TimeInterval {
        return hours(input) * 24
    }
    static func weeks(_ input: Double) -> TimeInterval {
        return days(input) * 7
    }
    static func months(_ input: Double) -> TimeInterval {
        return days(30.00) * input
    }
}
