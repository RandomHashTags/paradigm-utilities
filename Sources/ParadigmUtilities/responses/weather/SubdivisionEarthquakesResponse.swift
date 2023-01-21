//
//  SubdivisionEarthquakesResponse.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation
import SwiftSovereignStates

public struct SubdivisionEarthquakesResponse : Jsonable {
    public typealias ValueKeys = SubdivisionEarthquakesResponseValueKeys
    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var magnitudes:[SovereignRegionEarthquakes]
    
    public func getKeyValue(key: SubdivisionEarthquakesResponseValueKeys) -> Any? {
        switch key {
        case .magnitudes: return magnitudes
        }
    }
    
    public mutating func setKeyValue<T>(key: SubdivisionEarthquakesResponseValueKeys, value: T) {
        switch key {
        case .magnitudes:
            magnitudes = value as! [SovereignRegionEarthquakes]
            break
        }
    }
}

public enum SubdivisionEarthquakesResponseValueKeys : String, JsonableValueKeys {
    case magnitudes
    
    public func isTranslatable() -> Bool {
        return true
    }
}
