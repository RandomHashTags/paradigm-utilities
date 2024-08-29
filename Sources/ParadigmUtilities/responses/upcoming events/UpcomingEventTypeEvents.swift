//
//  UpcomingEventTypeEvents.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct UpcomingEventTypeEvents : Jsonable {    
    public let type:UpcomingEventType
    public var date_events:[UpcomingEventTypeDateEvents]?
    public var exact_time_events:[UpcomingEventTypeExactTimeEvents]?
    
    public init(type: UpcomingEventType, date_events: [UpcomingEventTypeDateEvents]? = nil, exact_time_events: [UpcomingEventTypeExactTimeEvents]? = nil) {
        self.type = type
        self.date_events = date_events
        self.exact_time_events = exact_time_events
    }
}

public struct UpcomingEventTypeDateEvents : Jsonable {    
    public let date:EventDate
    public var events:[PreUpcomingEvent]
    
    public init(date: EventDate, events: [PreUpcomingEvent]) {
        self.date = date
        self.events = events
    }
}

public struct UpcomingEventTypeExactTimeEvents : Jsonable {    
    public let time:Int64
    public var events:[PreUpcomingEvent]
    
    public init(time: Int64, events: [PreUpcomingEvent]) {
        self.time = time
        self.events = events
    }
}