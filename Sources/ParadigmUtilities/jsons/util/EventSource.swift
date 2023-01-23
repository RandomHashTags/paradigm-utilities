//
//  EventSource.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSource : Jsonable {
    public typealias ValueKeys = EventSourceValueKeys
    
    public var name:String
    public let url:String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    public func getKeyValue(key: EventSourceValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .url: return url
        }
    }
    public mutating func setKeyValue<T>(key: EventSourceValueKeys, value: T) {
        switch key {
        case .name:
            self.name = value as! String
            break
        default:
            break
        }
    }
}

public enum EventSourceValueKeys : String, JsonableValueKeys {
    case name
    case url
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
