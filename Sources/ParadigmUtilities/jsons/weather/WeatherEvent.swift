//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherEvent : Jsonable {
    public typealias ValueKeys = WeatherEventValueKeys
    
    public let id:String
    public var event:String
    public let defcon:Int
    
    public init(id: String, event: String, defcon: Int) {
        self.id = id
        self.event = event
        self.defcon = defcon
    }
    
    public func getKeyValue(key: WeatherEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .event: return event
        case .defcon: return defcon
        }
    }
    public mutating func setKeyValue<T>(key: WeatherEventValueKeys, value: T) {
        switch key {
        case .event:
            event = value as! String
            break
        default:
            break
        }
    }
}

public enum WeatherEventValueKeys : String, JsonableValueKeys {
    case id
    case event
    case defcon
    
    public var is_translatable : Bool {
        switch self {
        case .event:
            return true
        default:
            return false
        }
    }
}
