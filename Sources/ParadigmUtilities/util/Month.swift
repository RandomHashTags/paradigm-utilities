//
//  Month.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct Month {
    public private(set) static var allCases:[Month] = (0..<Calendar.current.monthSymbols.count).map({ Month(rawValue: $0) })
    
    public static let january:Month = Month(rawValue: 0)
    public static let february:Month = Month(rawValue: 1)
    public static let march:Month = Month(rawValue: 2)
    public static let april:Month = Month(rawValue: 3)
    public static let may:Month = Month(rawValue: 4)
    public static let june:Month = Month(rawValue: 5)
    public static let july:Month = Month(rawValue: 6)
    public static let august:Month = Month(rawValue: 7)
    public static let september:Month = Month(rawValue: 8)
    public static let october:Month = Month(rawValue: 9)
    public static let november:Month = Month(rawValue: 10)
    public static let december:Month = Month(rawValue: 11)
    
    public let rawValue:Int
    
    public static func valueOf(_ string: any StringProtocol) -> Month? {
        guard string.count >= 3 else { return nil }
        let key:Substring = string.lowercased().prefix(3)
        return Month.allCases.first(where: { $0.name.lowercased().starts(with: key) })
    }
    
    public var name : String {
        return Calendar.current.monthSymbols[rawValue-1]
    }
    public var previous : Month {
        return Month(rawValue: (rawValue - 1 < 0 ? Calendar.current.monthSymbols.count : rawValue) - 1)
    }
    public var next : Month {
        return Month(rawValue: rawValue + 1 == Calendar.current.monthSymbols.count ? 0 : rawValue + 1)
    }
    
    public func days(year: Int) -> Int {
        let components:DateComponents = DateComponents(year: year, month: rawValue)
        let calendar:Calendar = Calendar.current
        guard let date:Date = calendar.date(from: components), let range:Range<Int> = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date) else { return -1 }
        return range.count
    }
}
