//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherEvent : Jsonable {
    public typealias TranslationKeys = WeatherEventTranslationKeys
    
    public let id:String
    public var event:String
    public let defcon:Int
    
    public init(id: String, event: String, defcon: Int) {
        self.id = id
        self.event = event
        self.defcon = defcon
    }
    
    public func getTranslationKeyValue(key: WeatherEventTranslationKeys) -> Any? {
        switch key {
        case .event: return event
        }
    }
    public mutating func setTranslationKeyValue<T>(key: WeatherEventTranslationKeys, value: T) {
        switch key {
        case .event:
            event = value as! String
            break
        }
    }
}

public enum WeatherEventTranslationKeys : String, JsonableTranslationKey {
    case event
}
