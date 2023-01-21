//
//  HomeResponseUpcomingEventHolidaysResponse.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct HomeResponseUpcomingEventHolidaysResponse : Jsonable {
    public typealias ValueKeys = HomeResponseUpcomingEventHolidaysResponseValueKeys
    
    public let date:EventDate
    public var holidays:[PreHoliday]
    
    public init(date: EventDate, holidays: [PreHoliday]) {
        self.date = date
        self.holidays = holidays
    }
    
    public func getKeyValue(key: HomeResponseUpcomingEventHolidaysResponseValueKeys) -> Any? {
        switch key {
        case .holidays: return holidays
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseUpcomingEventHolidaysResponseValueKeys, value: T) {
        switch key {
        case .holidays:
            holidays = value as! [PreHoliday]
            break
        }
    }
}

public enum HomeResponseUpcomingEventHolidaysResponseValueKeys : String, JsonableValueKeys {
    case holidays
    
    public func isTranslatable() -> Bool {
        return true
    }
}
