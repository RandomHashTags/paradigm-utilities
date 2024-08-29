//
//  VideoGameEventsEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct VideoGameEventsEvent : Jsonable {
    public typealias JSONKeys = NoUpcomingEventValueKeys
        
    public init() {
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
    }
}
