//
//  HomeResponseWeather.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct HomeResponseWeather : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseWeatherValueKeys
    
    public var alerts:[CountryWeatherEvents]?
    public var earthquakes:[CountryEarthquakes]?
    public var natural_events:NaturalWeatherEvents?
    
    public init(alerts: [CountryWeatherEvents]?, earthquakes: [CountryEarthquakes]?, natural_events: NaturalWeatherEvents?) {
        self.alerts = alerts
        self.earthquakes = earthquakes
        self.natural_events = natural_events
    }
    
    public func getKeyValue(key: HomeResponseWeatherValueKeys) -> Any? {
        switch key {
        case .alerts: return alerts
        case .earthquakes: return earthquakes
        case .natural_events: return natural_events
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseWeatherValueKeys, value: T) {
        switch key {
        case .alerts:
            alerts = value as? [CountryWeatherEvents]
            break
        case .earthquakes:
            earthquakes = value as? [CountryEarthquakes]
            break
        case .natural_events:
            natural_events = value as? NaturalWeatherEvents
            break
        }
    }
}

public enum HomeResponseWeatherValueKeys : String, JsonableValueKeys {
    case alerts
    case earthquakes
    case natural_events
    
    public var is_translatable : Bool {
        switch self {
        case .alerts, .earthquakes, .natural_events:
            return true
        }
    }
}
