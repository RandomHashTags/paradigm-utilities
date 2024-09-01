//
//  VideoGameEventsEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct VideoGameEventsEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.video_game_events
    public typealias JSONKeys = NoUpcomingEventValueKeys
        
    public init() {
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
}
