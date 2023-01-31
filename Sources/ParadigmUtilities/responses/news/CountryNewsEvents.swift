//
//  CountryNewsEvents.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryNewsEvents : Jsonable {
    public typealias ValueKeys = CountryNewsEventsValueKeys
    
    public let country:Country
    public var events:Set<NewsEvent>
    
    public init(country: Country, events: Set<NewsEvent>) {
        self.country = country
        self.events = events
    }
    
    public func getKeyValue(key: CountryNewsEventsValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .events: return events
        }
    }
    public mutating func setKeyValue<T>(key: CountryNewsEventsValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! Set<NewsEvent>
            break
        default:
            break
        }
    }
}

public enum CountryNewsEventsValueKeys : String, JsonableValueKeys {
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
