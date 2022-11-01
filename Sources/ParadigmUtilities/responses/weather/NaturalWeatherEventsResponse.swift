//
//  NaturalWeatherEventsResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public final class NaturalWeatherEventsResponse : Jsonable {
    public typealias ValueKeys = NaturalWeatherEventsResponseValueKeys
    
    public static func == (lhs: NaturalWeatherEventsResponse, rhs: NaturalWeatherEventsResponse) -> Bool {
        return lhs.severe_storms == rhs.severe_storms && lhs.volcanoes == rhs.volcanoes && lhs.wildfires == rhs.wildfires
    }
    
    public var severe_storms:[Country?:[PreNaturalWeatherEvent]]?, volcanoes:[Country?:[PreNaturalWeatherEvent]]?, wildfires:[Country?:[PreNaturalWeatherEvent]]?
    
    public init(severe_storms: [Country?:[PreNaturalWeatherEvent]]?, volcanoes: [Country?:[PreNaturalWeatherEvent]]?, wildfires: [Country?:[PreNaturalWeatherEvent]]?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(severe_storms)
        hasher.combine(volcanoes)
        hasher.combine(wildfires)
    }
    
    public func getKeyValue(key: NaturalWeatherEventsResponseValueKeys) -> Any? {
        switch key {
        case .severe_storms: return severe_storms
        case .volcanoes: return volcanoes
        case .wildfires: return wildfires
        }
    }
    public func setKeyValue<T>(key: NaturalWeatherEventsResponseValueKeys, value: T) {
        switch key {
        case .severe_storms:
            severe_storms = value as? [Country?:[PreNaturalWeatherEvent]]
            break
        case .volcanoes:
            volcanoes = value as? [Country?:[PreNaturalWeatherEvent]]
            break
        case .wildfires:
            wildfires = value as? [Country?:[PreNaturalWeatherEvent]]
            break
        }
    }
}

public enum NaturalWeatherEventsResponseValueKeys : String, JsonableValueKeys {
    case severe_storms
    case volcanoes
    case wildfires
    
    public func isTranslatable() -> Bool {
        switch self {
        case .severe_storms, .volcanoes, .wildfires:
            return true
        }
    }
}
