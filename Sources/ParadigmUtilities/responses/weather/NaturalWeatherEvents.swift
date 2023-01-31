//
//  NaturalWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public struct NaturalWeatherEvents : Jsonable {
    public typealias ValueKeys = NaturalWeatherEventsResponseValueKeys
    
    public var severe_storms:Set<CountryNaturalWeatherEvents>?, volcanoes:Set<CountryNaturalWeatherEvents>?, wildfires:Set<CountryNaturalWeatherEvents>?
    
    public init(severe_storms: Set<CountryNaturalWeatherEvents>?, volcanoes: Set<CountryNaturalWeatherEvents>?, wildfires: Set<CountryNaturalWeatherEvents>?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
    
    public func getKeyValue(key: NaturalWeatherEventsResponseValueKeys) -> Any? {
        switch key {
        case .severe_storms: return severe_storms
        case .volcanoes: return volcanoes
        case .wildfires: return wildfires
        }
    }
    public mutating func setKeyValue<T>(key: NaturalWeatherEventsResponseValueKeys, value: T) {
        switch key {
        case .severe_storms:
            severe_storms = value as? Set<CountryNaturalWeatherEvents>
            break
        case .volcanoes:
            volcanoes = value as? Set<CountryNaturalWeatherEvents>
            break
        case .wildfires:
            wildfires = value as? Set<CountryNaturalWeatherEvents>
            break
        }
    }
}

public enum NaturalWeatherEventsResponseValueKeys : String, JsonableValueKeys {
    case severe_storms
    case volcanoes
    case wildfires
    
    public func isTranslatable() -> Bool {
        return true
    }
}
