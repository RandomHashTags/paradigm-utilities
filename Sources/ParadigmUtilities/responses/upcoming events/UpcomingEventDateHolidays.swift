//
//  UpcomingEventDateHolidays.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct UpcomingEventDateHolidays : Jsonable {
    public typealias JSONKeys = UpcomingEventDateHolidaysValueKeys
    
    public let date:EventDate
    public var holidays:[PreHoliday]
    
    public init(date: EventDate, holidays: [PreHoliday]) {
        self.date = date
        self.holidays = holidays
    }
    
    public func getKeyValue(key: UpcomingEventDateHolidaysValueKeys) -> Any? {
        switch key {
        case .date: return date
        case .holidays: return holidays
        }
    }
    public mutating func setKeyValue<T>(key: UpcomingEventDateHolidaysValueKeys, value: T) {
        switch key {
        case .holidays:
            holidays = value as! [PreHoliday]
            break
        default:
            break
        }
    }
}

public enum UpcomingEventDateHolidaysValueKeys : String, JsonableKeys {
    case date
    case holidays
    
    public var is_translatable : Bool {
        switch self {
        case .holidays:
            return true
        default:
            return false
        }
    }
}
