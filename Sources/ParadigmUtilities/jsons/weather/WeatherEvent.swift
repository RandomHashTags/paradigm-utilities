//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherEvent : Jsonable {
    public typealias ValueKeys = WeatherEventValueKeys
    
    public let type:WeatherEventType
    public let defcon:Int
    
    public init(type: WeatherEventType, defcon: Int) {
        self.type = type
        self.defcon = defcon
    }
    
    public func getKeyValue(key: WeatherEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .defcon: return defcon
        }
    }
    public mutating func setKeyValue<T>(key: WeatherEventValueKeys, value: T) {
    }
}

public enum WeatherEventValueKeys : String, JsonableValueKeys {
    case type
    case defcon
    
    public var is_translatable : Bool {
        return false
    }
}
