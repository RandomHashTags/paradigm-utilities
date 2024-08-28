//
//  CountryGovernmentRecentActivityDate.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation

public struct CountryGovernmentRecentActivityDate : Jsonable {
    public typealias JSONKeys = CountryGovernmentRecentActivityDatesValueKeys
    
    public let date:EventDate
    public var activity:[GovernmentPreAdministrationBill]
    
    public init(date: EventDate, activity: [GovernmentPreAdministrationBill]) {
        self.date = date
        self.activity = activity
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityDatesValueKeys) -> Any? {
        switch key {
        case .date: return date
        case .activity: return activity
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityDatesValueKeys, value: T) {
        switch key {
        case .activity:
            activity = value as! [GovernmentPreAdministrationBill]
            break
        default:
            break
        }
    }
}

public enum CountryGovernmentRecentActivityDatesValueKeys : String, JsonableKeys {
    case date
    case activity
}
