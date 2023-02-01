//
//  CountryWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryWeatherEvents : Jsonable {
    public typealias ValueKeys = CountryWeatherEventAlertsValueKeys
    
    public let country:Country
    public var subdivisions:[SubdivisionWeatherEvents]
    
    public init(country: Country, subdivisions: [SubdivisionWeatherEvents]) {
        self.country = country
        self.subdivisions = subdivisions
    }
    
    public func getKeyValue(key: CountryWeatherEventAlertsValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .subdivisions: return subdivisions
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryWeatherEventAlertsValueKeys, value: T) {
        switch key {
        case .subdivisions:
            subdivisions = value as! [SubdivisionWeatherEvents]
            break
        default:
            break
        }
    }
}

public enum CountryWeatherEventAlertsValueKeys : String, JsonableValueKeys {
    case country
    case subdivisions
    
    public func isTranslatable() -> Bool {
        switch self {
        case .subdivisions:
            return true
        default:
            return false
        }
    }
}
