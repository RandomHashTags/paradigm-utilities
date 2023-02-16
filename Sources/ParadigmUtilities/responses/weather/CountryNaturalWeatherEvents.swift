//
//  CountryNaturalWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryNaturalWeatherEvents : Jsonable {
    public typealias ValueKeys = CountryNaturalWeatherEventsValueKeys
    
    public let country:Country?
    public var events:[PreNaturalWeatherEvent]
    
    public init(country: Country?, events: [PreNaturalWeatherEvent]) {
        self.country = country
        self.events = events
    }
    
    public func getKeyValue(key: CountryNaturalWeatherEventsValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .events: return events
        }
    }
    public mutating func setKeyValue<T>(key: CountryNaturalWeatherEventsValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [PreNaturalWeatherEvent]
            break
        default:
            break
        }
    }
}

public enum CountryNaturalWeatherEventsValueKeys : String, JsonableValueKeys {
    case country
    case events
    
    public var is_translatable : Bool {
        switch self {
        case .events:
            return true
        default:
            return false
        }
    }
}
