//
//  HolidayType.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public enum HolidayType : String, CaseIterable, Jsonable {
    case fun
    case gregorian
    case religious_christian_east
    case religious_christian_west
    case united_nations
    case unofficial
    
    public static func value_of(_ string: String) -> HolidayType? {
        return HolidayType.allCases.first(where: { string.elementsEqual("\($0)") })
    }
    
    public func get_emoji() -> String? {
        switch self {
        case .fun: return "🤪"
        case .gregorian: return "📅"
        case .religious_christian_east: return "✝"
        case .religious_christian_west: return "✝"
        case .united_nations: return "🇺🇳"
        case .unofficial: return "📆"
        }
    }
}
