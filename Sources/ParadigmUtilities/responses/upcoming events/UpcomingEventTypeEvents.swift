//
//  UpcomingEventTypeEvents.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

public extension Responses.UpcomingEvents {
    struct TypeEvents : Jsonable {    
        public let type:UpcomingEventType
        public var date_events:[TypeDateEvents]?
        public var exact_time_events:[TypeExactTimeEvents]?
        
        public init(type: UpcomingEventType, date_events: [TypeDateEvents]? = nil, exact_time_events: [TypeExactTimeEvents]? = nil) {
            self.type = type
            self.date_events = date_events
            self.exact_time_events = exact_time_events
        }
    }

    struct TypeDateEvents : Jsonable {    
        public let date:EventDate
        public var events:[PreUpcomingEvent]
        
        public init(date: EventDate, events: [PreUpcomingEvent]) {
            self.date = date
            self.events = events
        }
    }

    struct TypeExactTimeEvents : Jsonable {    
        public let time:Int64
        public var events:[PreUpcomingEvent]
        
        public init(time: Int64, events: [PreUpcomingEvent]) {
            self.time = time
            self.events = events
        }
    }
}