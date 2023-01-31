//
//  PreEarthquakeMagnitude.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

import Foundation

public struct PreEarthquakeMagnitude : Jsonable {
    public typealias ValueKeys = PreEarthquakeMagnitudeValueKeys
    
    public let mag:String
    public var quakes:Set<PreEarthquake>
    
    public init(mag: String, quakes: Set<PreEarthquake>) {
        self.mag = mag
        self.quakes = quakes
    }
    
    public func getKeyValue(key: PreEarthquakeMagnitudeValueKeys) -> Any? {
        switch key {
        case .mag: return mag
        case .quakes: return quakes
        }
    }
    public mutating func setKeyValue<T>(key: PreEarthquakeMagnitudeValueKeys, value: T) {
        switch key {
        case .quakes:
            quakes = value as! Set<PreEarthquake>
            break
        default:
            break
        }
    }
}

public enum PreEarthquakeMagnitudeValueKeys : String, JsonableValueKeys {
    case mag
    case quakes
    
    public func isTranslatable() -> Bool {
        switch self {
        case .quakes:
            return true
        default:
            return false
        }
    }
}
