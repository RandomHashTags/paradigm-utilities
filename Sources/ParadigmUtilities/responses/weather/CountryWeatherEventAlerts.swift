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
        case .events: return events
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryWeatherEventAlertsValueKeys, value: T) {
        switch key {
        case .events:
            self.events = value as! [WeatherEvent]
            break
        }
    }
}

public enum CountryWeatherEventAlertsValueKeys : String, JsonableValueKeys {
    case events
    
    public func isTranslatable() -> Bool {
        return true
    }
}
