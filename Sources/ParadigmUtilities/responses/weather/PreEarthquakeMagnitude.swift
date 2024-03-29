//
//  PreEarthquakeMagnitude.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

import Foundation

public struct PreEarthquakeMagnitude : Jsonable {
    public typealias JSONKeys = PreEarthquakeMagnitudeValueKeys
    
    public let mag:String
    public var quakes:[PreEarthquake]
    
    public init(mag: String, quakes: [PreEarthquake]) {
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
            quakes = value as! [PreEarthquake]
            break
        default:
            break
        }
    }
}

public enum PreEarthquakeMagnitudeValueKeys : String, JsonableKeys {
    case mag
    case quakes
    
    public var is_translatable : Bool {
        switch self {
        case .quakes:
            return true
        default:
            return false
        }
    }
}
