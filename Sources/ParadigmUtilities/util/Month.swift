//
//  Month.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public enum Month : Int, CaseIterable {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
    
    public static func valueOf(_ string: String) -> Month? {
        guard string.count >= 3 else { return nil }
        let key:Substring = string.lowercased().prefix(3)
        return Month.allCases.first(where: { "\($0)".starts(with: key) })
    }
    public static func valueOf(_ monthValue: Int) -> Month? {
        return Month.allCases.first(where: { $0.rawValue == monthValue })
    }
    
    public func name() -> String {
        switch self {
        case .january: return "January"
        case .february: return "February"
        case .march: return "March"
        case .april: return "April"
        case .may: return "May"
        case .june: return "June"
        case .july: return "July"
        case .august: return "August"
        case .september: return "September"
        case .october: return "October"
        case .november: return "November"
        case .december: return "December"
        }
    }
    public func previous() -> Month {
        return self == .january ? .december : Month.valueOf(rawValue-1)!
    }
    public func next() -> Month {
        return self == .december ? .january : Month.valueOf(rawValue+1)!
    }
    
    public func maxLength() -> Int {
        switch self {
        case .february:
            return 29
        case .april,
                .june,
                .september,
                .november:
            return 30
        default:
            return 31
        }
    }
}
