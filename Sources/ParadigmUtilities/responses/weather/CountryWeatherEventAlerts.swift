//
//  CountryWeatherEventAlerts.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryWeatherEventAlerts : Jsonable {
    public typealias ValueKeys = CountryWeatherEventAlertsValueKeys
    
    public let country:Country
    public var events:[WeatherEvent]
    
    public init(country: Country, events: [WeatherEvent]) {
        self.country = country
        self.events = events
    }
    
    public func getKeyValue(key: CountryWeatherEventAlertsValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .events: return events
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryWeatherEventAlertsValueKeys, value: T) {
        switch key {
        case .events:
            self.events = value as! [WeatherEvent]
            break
        default:
            break
        }
    }
}

public enum CountryWeatherEventAlertsValueKeys : String, JsonableValueKeys {
    case country
    case events
    
    public func isTranslatable() -> Bool {
        switch self {
        case .events:
            return true
        default:
            return false
        }
    }
}
