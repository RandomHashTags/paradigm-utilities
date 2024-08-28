//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseUpcomingEvents : HomeResponseProtocol {
    public typealias JSONKeys = HomeResponseUpcomingEventsValueKeys
    
    public var holidays_near:[UpcomingEventDateHolidays]?
    public var events:[UpcomingEventTypeEvents]?
    public var movie_production_companies:MovieProductionCompaniesResponse?
        
    public init(holidays_near: [UpcomingEventDateHolidays]?, events: [UpcomingEventTypeEvents]?, movie_production_companies: MovieProductionCompaniesResponse?) {
        self.holidays_near = holidays_near
        self.events = events
        self.movie_production_companies = movie_production_companies
    }
    
    public func getKeyValue(key: HomeResponseUpcomingEventsValueKeys) -> Any? {
        switch key {
        case .holidays_near: return holidays_near
        case .events: return events
        case .movie_production_companies: return movie_production_companies
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseUpcomingEventsValueKeys, value: T) {
        switch key {
        case .holidays_near:
            holidays_near = value as? [UpcomingEventDateHolidays]
            break
        case .events:
            events = value as? [UpcomingEventTypeEvents]
            break
        case .movie_production_companies:
            movie_production_companies = value as? MovieProductionCompaniesResponse
            break
        }
    }
}

public enum HomeResponseUpcomingEventsValueKeys : String, JsonableKeys {
    case holidays_near
    case events
    case movie_production_companies
}
