//
//  SubdivisionEarthquake.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation
import SwiftSovereignStates

public struct SubdivisionEarthquake : Jsonable {
    public typealias ValueKeys = SubdivisionEarthquakesResponseValueKeys
    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var magnitudes:Set<SubdivisionEarthquakeMagnitude>
    
    public init(subdivision: (any SovereignStateSubdivision)?, magnitudes: Set<SubdivisionEarthquakeMagnitude>) {
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
            magnitudes = value as! Set<SubdivisionEarthquakeMagnitude>
            break
        default:
            break
        }
    }
}

public enum SubdivisionEarthquakesResponseValueKeys : String, JsonableValueKeys {
    case subdivision
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
