//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseUpcomingEvents : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseUpcomingEventsValueKeys
    
    @CodableOmittable public var holidays_near:Set<UpcomingEventDateHolidays>?
    public var events:Set<UpcomingEventTypeEvents>?
    @CodableOmittable public var movie_production_companies:MovieProductionCompaniesResponse?
        
    public init(holidays_near: Set<UpcomingEventDateHolidays>?, events: Set<UpcomingEventTypeEvents>?, movie_production_companies: MovieProductionCompaniesResponse?) {
        self._holidays_near = CodableOmittable(holidays_near)
        self.events = events
        self._movie_production_companies = CodableOmittable(movie_production_companies)
    }
    
    public func getKeyValue(key: HomeResponseUpcomingEventsValueKeys) -> Any? {
        switch key {
        case .holidays_near: return _holidays_near
        case .events: return events
        case .movie_production_companies: return _movie_production_companies
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseUpcomingEventsValueKeys, value: T) {
        switch key {
        case .holidays_near:
            _holidays_near = value as! CodableOmittable<Set<UpcomingEventDateHolidays>>
            break
        case .events:
            events = value as? Set<UpcomingEventTypeEvents>
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
        case .holidays_near, .movie_production_companies:
            return true
        default:
            return false
        }
    }
}
