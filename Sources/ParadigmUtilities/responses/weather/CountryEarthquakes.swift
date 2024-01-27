//
//  CountryEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryEarthquakes : Jsonable {
    public typealias JSONKeys = CountryEarthquakesValueKeys
    
    public let country:Country?
    public var subdivisions:[SubdivisionEarthquakes]
    
    public init(country: Country?, subdivisions: [SubdivisionEarthquakes]) {
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
            subdivisions = value as! [SubdivisionEarthquakes]
            break
        default:
            break
        }
    }
}

public enum CountryEarthquakesValueKeys : String, JsonableKeys {
    case country
    case subdivisions
    
    public var is_translatable : Bool {
        switch self {
        case .subdivisions:
            return true
        default:
            return false
        }
    }
}
