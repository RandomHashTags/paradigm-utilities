//
//  PresentationEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct PresentationEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.presentations
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
}

public extension PresentationEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case tag
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.astronomy_picture_of_the_day
        }
    }
}