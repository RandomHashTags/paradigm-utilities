//
//  UFCEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct UFCEvent : UpcomingEventData {
    public typealias JSONKeys = NoUpcomingEventValueKeys
        
    public init() {
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
}
