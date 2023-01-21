//
//  SovereignRegionEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct SovereignRegionEarthquakes : Jsonable {
    public typealias ValueKeys = SovereignRegionEarthquakesValueKeys
    
    public let magnitude:String
    public var quakes:[PreEarthquake]
    
    public init(magnitude: String, quakes: [PreEarthquake]) {
        self.magnitude = magnitude
        self.quakes = quakes
    }
    
    public func getKeyValue(key: SovereignRegionEarthquakesValueKeys) -> Any? {
        switch key {
        case .quakes: return quakes
        }
    }
    
    public mutating func setKeyValue<T>(key: SovereignRegionEarthquakesValueKeys, value: T) {
        switch key {
        case .quakes:
            quakes = value as! [PreEarthquake]
            break
        }
    }
}

public enum SovereignRegionEarthquakesValueKeys : String, JsonableValueKeys {
    case quakes
    
    public func isTranslatable() -> Bool {
        return true
    }
}
