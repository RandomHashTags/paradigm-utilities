//
//  EventSource.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSource : Jsonable {
    public typealias TranslationKeys = EventSourceTranslationKeys
    
    public var siteName:String
    public let url:String
    
    public init(siteName: String, url: String) {
        self.siteName = siteName
        self.url = url
    }
    
    public func getKeyValue(key: EventSourceTranslationKeys) -> Any? {
        switch key {
        case .siteName: return siteName
        }
    }
    public mutating func setKeyValue<T>(key: EventSourceTranslationKeys, value: T) {
        switch key {
        case .siteName:
            self.siteName = value as! String
            break
        }
    }
}

public enum EventSourceTranslationKeys : String, JsonableTranslationKey {
    case siteName
}
