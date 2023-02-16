//
//  SubdivisionEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation
import SwiftSovereignStates

public struct SubdivisionEarthquakes : Jsonable {
    public typealias ValueKeys = SubdivisionEarthquakesResponseValueKeys
    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var magnitudes:[PreEarthquakeMagnitude]
    
    public init(subdivision: (any SovereignStateSubdivision)?, magnitudes: [PreEarthquakeMagnitude]) {
        self.subdivision = subdivision?.wrapped()
        self.magnitudes = magnitudes
    }
    
    public func getKeyValue(key: SubdivisionEarthquakesResponseValueKeys) -> Any? {
        switch key {
        case .subdivision: return subdivision
        case .magnitudes: return magnitudes
        }
    }
    
    public mutating func setKeyValue<T>(key: SubdivisionEarthquakesResponseValueKeys, value: T) {
        switch key {
        case .magnitudes:
            magnitudes = value as! [PreEarthquakeMagnitude]
            break
        default:
            break
        }
    }
}

public enum SubdivisionEarthquakesResponseValueKeys : String, JsonableValueKeys {
    case subdivision
    case magnitudes
    
    public var is_translatable : Bool {
        switch self {
        case .magnitudes:
            return true
        default:
            return false
        }
    }
}
