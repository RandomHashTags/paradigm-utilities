//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseUpcomingEvents : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseUpcomingEventsValueKeys
    
    public static func == (lhs: HomeResponseUpcomingEvents, rhs: HomeResponseUpcomingEvents) -> Bool {
        return lhs.holidays_near == rhs.holidays_near && lhs.events == rhs.events && lhs.movie_production_companies == rhs.movie_production_companies
    }
    
    public var holidays_near:[EventDate:[PreHoliday]]?, events:[UpcomingEventType:[PreUpcomingEvent]]?
    @CodableOmittable public var movie_production_companies:MovieProductionCompaniesResponse?
    
    public init(holidays_near: [EventDate:[PreHoliday]]?, events: [UpcomingEventType:[PreUpcomingEvent]]?, movie_production_companies: MovieProductionCompaniesResponse?) {
        self.holidays_near = holidays_near
        self.events = events
        self._movie_production_companies = CodableOmittable(movie_production_companies)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(holidays_near)
        hasher.combine(events)
        hasher.combine(_movie_production_companies)
    }
    
    public func getKeyValue(key: HomeResponseUpcomingEventsValueKeys) -> Any? {
        switch key {
        case .holidays_near: return holidays_near
        case .events: return events
        case .movie_production_companies: return _movie_production_companies
        }
    }
    public func setKeyValue<T>(key: HomeResponseUpcomingEventsValueKeys, value: T) {
        switch key {
        case .holidays_near:
            holidays_near = value as? [EventDate:[PreHoliday]]
            break
        case .events:
            events = value as? [UpcomingEventType:[PreUpcomingEvent]]
            break
        case .movie_production_companies:
            _movie_production_companies = value as! CodableOmittable<MovieProductionCompaniesResponse>
            break
        }
    }
}


public enum HomeResponseUpcomingEventsValueKeys : String, JsonableValueKeys {
    case holidays_near
    case events
    case movie_production_companies
    
    public func isTranslatable() -> Bool {
        switch self {
        case .holidays_near, .events, .movie_production_companies:
            return true
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .movie_production_companies:
            return true
        default:
            return false
        }
    }
}
