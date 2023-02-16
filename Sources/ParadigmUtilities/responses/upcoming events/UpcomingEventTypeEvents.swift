//
//  UpcomingEventTypeEvents.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct UpcomingEventTypeEvents : Jsonable {
    public typealias ValueKeys = UpcomingEventTypeEventsValueKeys
    
    public let type:UpcomingEventType
    @CodableOmittable public var date_events:[UpcomingEventTypeDateEvents]?
    @CodableOmittable public var exact_time_events:[UpcomingEventTypeExactTimeEvents]?
    
    public init(type: UpcomingEventType, date_events: [UpcomingEventTypeDateEvents]? = nil, exact_time_events: [UpcomingEventTypeExactTimeEvents]? = nil) {
        self.type = type
        self._date_events = CodableOmittable(date_events)
        self._exact_time_events = CodableOmittable(exact_time_events)
    }
    
    public func getKeyValue(key: UpcomingEventTypeEventsValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .date_events: return _date_events
        case .exact_time_events: return _exact_time_events
        }
    }
    public mutating func setKeyValue<T>(key: UpcomingEventTypeEventsValueKeys, value: T) {
        switch key {
        case .date_events:
            _date_events = value as! CodableOmittable<[UpcomingEventTypeDateEvents]>
            break
        case .exact_time_events:
            _exact_time_events = value as! CodableOmittable<[UpcomingEventTypeExactTimeEvents]>
            break
        default:
            break
        }
    }
}

public enum UpcomingEventTypeEventsValueKeys : String, JsonableValueKeys {
    case type
    case date_events
    case exact_time_events
    
    public var is_translatable : Bool {
        switch self {
        case .date_events, .exact_time_events:
            return true
        default:
            return false
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .date_events, .exact_time_events:
            return true
        default:
            return false
        }
    }
}

public struct UpcomingEventTypeDateEvents : Jsonable {
    public typealias ValueKeys = UpcomingEventTypeDateEventsValueKeys
    
    public let date:EventDate
    public var events:[PreUpcomingEvent]
    
    public init(date: EventDate, events: [PreUpcomingEvent]) {
        self.date = date
        self.events = events
    }
    
    public func getKeyValue(key: UpcomingEventTypeDateEventsValueKeys) -> Any? {
        switch key {
        case .date: return date
        case .events: return events
        }
    }
    public mutating func setKeyValue<T>(key: UpcomingEventTypeDateEventsValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [PreUpcomingEvent]
            break
        default:
            break
        }
    }
}
public enum UpcomingEventTypeDateEventsValueKeys : String, JsonableValueKeys {
    case date
    case events
    
    public var is_translatable : Bool {
        switch self {
        case .events:
            return true
        default:
            return false
        }
    }
}

public struct UpcomingEventTypeExactTimeEvents : Jsonable {
    public typealias ValueKeys = UpcomingEventTypeExactTimeEventsValueKeys
    
    public let time:Int64
    public var events:[PreUpcomingEvent]
    
    public init(time: Int64, events: [PreUpcomingEvent]) {
        self.time = time
        self.events = events
    }
    
    public func getKeyValue(key: UpcomingEventTypeExactTimeEventsValueKeys) -> Any? {
        switch key {
        case .time: return time
        case .events: return events
        }
    }
    public mutating func setKeyValue<T>(key: UpcomingEventTypeExactTimeEventsValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [PreUpcomingEvent]
            break
        default:
            break
        }
    }
}
public enum UpcomingEventTypeExactTimeEventsValueKeys : String, JsonableValueKeys {
    case time
    case events
    
    public var is_translatable : Bool {
        switch self {
        case .events:
            return true
        default:
            return false
        }
    }
}
