//
//  CountryGovernmentRecentActivity.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public struct CountryGovernmentRecentActivity : Jsonable {
    public typealias JSONKeys = CountryGovernmentRecentActivityValueKeys
    
    public let country:Country
    public var activity:[CountryGovernmentRecentActivityChamber]
    
    public init(country: Country, activity: [CountryGovernmentRecentActivityChamber]) {
        self.country = country
        self.activity = activity
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .activity: return activity
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityValueKeys, value: T) {
        switch key {
        case .activity:
            activity = value as! [CountryGovernmentRecentActivityChamber]
            break
        default:
            break
        }
    }
}

public enum CountryGovernmentRecentActivityValueKeys : String, JsonableKeys {
    case country
    case activity
    
    public var is_translatable : Bool {
        switch self {
        case .activity:
            return true
        default:
            return false
        }
    }
}
