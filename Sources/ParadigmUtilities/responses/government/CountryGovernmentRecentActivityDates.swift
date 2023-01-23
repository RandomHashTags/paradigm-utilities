//
//  CountryGovernmentRecentActivityDates.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation

public struct CountryGovernmentRecentActivityDates : Jsonable {
    public typealias ValueKeys = CountryGovernmentRecentActivityDatesValueKeys
    
    public let date:EventDate
    public var activity:[GovernmentPreAdministrationBill]
    
    public func getKeyValue(key: CountryGovernmentRecentActivityDatesValueKeys) -> Any? {
        switch key {
        case .activity: return activity
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityDatesValueKeys, value: T) {
        switch key {
        case .activity:
            activity = value as! [GovernmentPreAdministrationBill]
            break
        }
    }
}

public enum CountryGovernmentRecentActivityDatesValueKeys : String, JsonableValueKeys {
    case activity
    
    public func isTranslatable() -> Bool {
        return true
    }
}
