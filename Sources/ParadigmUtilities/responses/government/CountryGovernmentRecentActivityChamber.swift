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
    public var dates:[CountryGovernmentRecentActivityDate]
    
    public init(chamber: GovernmentChamberWrapper, dates: [CountryGovernmentRecentActivityDate]) {
        self.chamber = chamber
        self.dates = dates
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityChamberValueKeys) -> Any? {
        switch key {
        case .chamber: return chamber
        case .dates: return dates
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityChamberValueKeys, value: T) {
        switch key {
        case .dates:
            dates = value as! [CountryGovernmentRecentActivityDate]
            break
        default:
            break
        }
    }
}

public enum CountryGovernmentRecentActivityChamberValueKeys : String, JsonableValueKeys {
    case chamber
    case dates
    
    public var is_translatable : Bool {
        switch self {
        case .dates:
            return true
        default:
            return false
        }
    }
}
