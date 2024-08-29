//
//  PresentationEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct PresentationEvent : UpcomingEventData {
    public typealias JSONKeys = ValueKeys
    
    public var tag:String
        
    public init(tag: String) {
        self.tag = tag
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .tag: return tag
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .tag:
            tag = value as! String
            break
        }
    }
}

public extension PresentationEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case tag
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.astronomy_picture_of_the_day
        }
    }
}