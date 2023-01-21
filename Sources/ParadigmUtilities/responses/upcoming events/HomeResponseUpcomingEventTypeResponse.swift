//
//  HomeResponseUpcomingEventTypeResponse.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import Foundation

public struct HomeResponseUpcomingEventTypeResponse : Jsonable {
    public typealias ValueKeys = HomeResponseUpcomingEventTypeResponseValueKeys
    
    public let type:UpcomingEventType
    @CodableOmittable public var date_events:[HomeResponseUpcomingEventsDateResponse]?
    @CodableOmittable public var exact_time_events:[HomeResponseUpcomingEventsExactTimesResponse]?
    
    public init(type: UpcomingEventType, date_events: [HomeResponseUpcomingEventsDateResponse]? = nil, exact_time_events: [HomeResponseUpcomingEventsExactTimesResponse]? = nil) {
        self.type = type
        self._date_events = CodableOmittable(date_events)
        self._exact_time_events = CodableOmittable(exact_time_events)
    }
    
    public func getKeyValue(key: HomeResponseUpcomingEventTypeResponseValueKeys) -> Any? {
        switch key {
        case .date_events: return _date_events
        case .exact_time_events: return _exact_time_events
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseUpcomingEventTypeResponseValueKeys, value: T) {
        switch key {
        case .date_events:
            _date_events = value as! CodableOmittable<[HomeResponseUpcomingEventsDateResponse]>
            break
        case .exact_time_events:
            _exact_time_events = value as! CodableOmittable<[HomeResponseUpcomingEventsExactTimesResponse]>
            break
        }
    }
}

public enum HomeResponseUpcomingEventTypeResponseValueKeys : String, JsonableValueKeys {
    case date_events
    case exact_time_events
    
    public func isTranslatable() -> Bool {
        switch self {
        case .date_events, .exact_time_events:
            return true
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .date_events, .exact_time_events:
            return true
        }
    }
}

private protocol HomeResponseUpcomingEventsTimeResponse : Jsonable where ValueKeys == HomeResponseUpcomingEventsDateResponseValueKeys {
    var events:[PreUpcomingEvent] { get set }
}
extension HomeResponseUpcomingEventsTimeResponse {
    public func getKeyValue(key: HomeResponseUpcomingEventsDateResponseValueKeys) -> Any? {
        switch key {
        case .events: return events
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseUpcomingEventsDateResponseValueKeys, value: T) {
        switch key {
        case .events:
            events = value as! [PreUpcomingEvent]
            break
        }
    }
}
public struct HomeResponseUpcomingEventsDateResponse : HomeResponseUpcomingEventsTimeResponse {
    public let date:EventDate
    public var events:[PreUpcomingEvent]
    
    public init(date: EventDate, events: [PreUpcomingEvent]) {
        self.date = date
        self.events = events
    }
}
public struct HomeResponseUpcomingEventsExactTimesResponse : HomeResponseUpcomingEventsTimeResponse {
    public let time:Int64
    public var events:[PreUpcomingEvent]
    
    public init(time: Int64, events: [PreUpcomingEvent]) {
        self.time = time
        self.events = events
    }
}
public enum HomeResponseUpcomingEventsDateResponseValueKeys : String, JsonableValueKeys {
    case events
    
    public func isTranslatable() -> Bool {
        switch self {
        case .events:
            return true
        }
    }
}
