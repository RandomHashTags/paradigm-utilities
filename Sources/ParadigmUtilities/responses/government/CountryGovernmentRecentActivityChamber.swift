//
//  CountryGovernmentRecentActivityChamber.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation

public struct CountryGovernmentRecentActivityChamber : Jsonable {
    public typealias ValueKeys = CountryGovernmentRecentActivityChamberValueKeys
    
    public let chamber:GovernmentChamberWrapper
    public var dates:[CountryGovernmentRecentActivityDates]
    
    public init(chamber: GovernmentChamberWrapper, dates: [CountryGovernmentRecentActivityDates]) {
        self.chamber = chamber
        self.dates = dates
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityChamberValueKeys) -> Any? {
        switch key {
        case .dates: return dates
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityChamberValueKeys, value: T) {
        switch key {
        case .dates:
            dates = value as! [CountryGovernmentRecentActivityDates]
            break
        }
    }
}

public enum CountryGovernmentRecentActivityChamberValueKeys : String, JsonableValueKeys {
    case dates
    
    public func isTranslatable() -> Bool {
        return true
    }
}
