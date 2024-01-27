//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseUpcomingEvents : HomeResponseProtocol {
    public typealias JSONKeys = HomeResponseUpcomingEventsValueKeys
    
    @CodableOmittable public var holidays_near:[UpcomingEventDateHolidays]?
    public var events:[UpcomingEventTypeEvents]?
    @CodableOmittable public var movie_production_companies:MovieProductionCompaniesResponse?
        
    public init(holidays_near: [UpcomingEventDateHolidays]?, events: [UpcomingEventTypeEvents]?, movie_production_companies: MovieProductionCompaniesResponse?) {
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
            _holidays_near = value as! CodableOmittable<[UpcomingEventDateHolidays]>
            break
        case .events:
            events = value as? [UpcomingEventTypeEvents]
            break
        case .movie_production_companies:
            _movie_production_companies = value as! CodableOmittable<MovieProductionCompaniesResponse>
            break
        }
    }
}

public enum HomeResponseUpcomingEventsValueKeys : String, JsonableKeys {
    case holidays_near
    case events
    case movie_production_companies
    
    public var is_translatable : Bool {
        switch self {
        case .holidays_near, .events, .movie_production_companies:
            return true
        }
    }
    public var is_omittable : Bool {
        switch self {
        case .holidays_near, .movie_production_companies:
            return true
        default:
            return false
        }
    }
}
