//
//  CountryEarthquakesResponse.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryEarthquakesResponse : Jsonable {
    public typealias ValueKeys = CountryEarthquakesResponseValueKeys
    
    public let country:Country?
    public var subdivisions:[SubdivisionEarthquakesResponse]
    
    public func getKeyValue(key: CountryEarthquakesResponseValueKeys) -> Any? {
        switch key {
        case .subdivisions: return subdivisions
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryEarthquakesResponseValueKeys, value: T) {
        switch key {
        case .subdivisions:
            subdivisions = value as! [SubdivisionEarthquakesResponse]
            break
        }
    }
}

public enum CountryEarthquakesResponseValueKeys : String, JsonableValueKeys {
    case subdivisions
    
    public func isTranslatable() -> Bool {
        return true
    }
}
