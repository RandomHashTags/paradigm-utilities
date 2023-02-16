//
//  SubdivisionWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/31/23.
//

import Foundation
import SwiftSovereignStates

public struct SubdivisionWeatherEvents : Jsonable {
    public typealias ValueKeys = SubdivisionWeatherEventsValueKeys
    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var events:[WeatherEvent]
    
    public init(subdivision: SovereignStateSubdivisionWrapper?, events: [WeatherEvent]) {
        self.subdivision = subdivision
        self.events = events
    }
    
    public func getKeyValue(key: SubdivisionWeatherEventsValueKeys) -> Any? {
        switch key {
        case .subdivision: return subdivision
        case .events: return events
        }
    }
    
    public mutating func setKeyValue<T>(key: SubdivisionWeatherEventsValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [WeatherEvent]
            break
        default:
            break
        }
    }
}

public enum SubdivisionWeatherEventsValueKeys : String, JsonableValueKeys {
    case subdivision
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
