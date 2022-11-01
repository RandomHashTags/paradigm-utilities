//
//  EventSource.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSource : Jsonable {
    public typealias ValueKeys = EventSourceValueKeys
    
    public var siteName:String
    public let url:String
    
    public init(siteName: String, url: String) {
        self.siteName = siteName
        self.url = url
    }
    
    public func getKeyValue(key: EventSourceValueKeys) -> Any? {
        switch key {
        case .siteName: return siteName
        case .url: return url
        }
    }
    public mutating func setKeyValue<T>(key: EventSourceValueKeys, value: T) {
        switch key {
        case .siteName:
            self.siteName = value as! String
            break
        default:
            break
        }
    }
}

public enum EventSourceValueKeys : String, JsonableValueKeys {
    case siteName
    case url
    
    public func isTranslatable() -> Bool {
        switch self {
        case .siteName:
            return true
        default:
            return false
        }
    }
}
