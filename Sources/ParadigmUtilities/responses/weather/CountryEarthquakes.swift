//
//  CountryEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryEarthquakes : Jsonable {
    public typealias ValueKeys = CountryEarthquakesValueKeys
    
    public let country:Country?
    public var magnitudes:[PreEarthquakeMagnitude]
    
    public init(country: Country?, magnitudes: [PreEarthquakeMagnitude]) {
        self.country = country
        self.magnitudes = magnitudes
    }
    
    public func getKeyValue(key: CountryEarthquakesValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .magnitudes: return magnitudes
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryEarthquakesValueKeys, value: T) {
        switch key {
        case .magnitudes:
            magnitudes = value as! [PreEarthquakeMagnitude]
            break
        default:
            break
        }
    }
}

public enum CountryEarthquakesValueKeys : String, JsonableValueKeys {
    case country
    case magnitudes
    
    public func isTranslatable() -> Bool {
        switch self {
        case .magnitudes:
            return true
        default:
            return false
        }
    }
}
