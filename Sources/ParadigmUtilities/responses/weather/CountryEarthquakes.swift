//
//  CountryEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryEarthquakes : Jsonable {
    public typealias ValueKeys = CountryEarthquakesValueKeys
    
    public let country:Country?
    public var subdivisions:[SubdivisionEarthquake]
    
    public init(country: Country?, subdivisions: [SubdivisionEarthquake]) {
        self.country = country
        self.subdivisions = subdivisions
    }
    
    public func getKeyValue(key: CountryEarthquakesValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .subdivisions: return subdivisions
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryEarthquakesValueKeys, value: T) {
        switch key {
        case .subdivisions:
            subdivisions = value as! [SubdivisionEarthquake]
            break
        default:
            break
        }
    }
}

public enum CountryEarthquakesValueKeys : String, JsonableValueKeys {
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
