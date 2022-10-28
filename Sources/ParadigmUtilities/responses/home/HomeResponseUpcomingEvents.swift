//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseUpcomingEvents : HomeResponseProtocol {
    public typealias TranslationKeys = HomeResponseUpcomingEventsTranslationKeys
    public typealias OmittableKeys = HomeResponseUpcomingEventsOmittableKeys
    
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
        hasher.combine(movie_production_companies)
    }
    
    public func getTranslationKeyValue(key: HomeResponseUpcomingEventsTranslationKeys) -> Any? {
        switch key {
        case .holidays_near: return holidays_near
        case .events: return events
        case .movie_production_companies: return movie_production_companies
        }
    }
    public func setTranslationKeyValue<T>(key: HomeResponseUpcomingEventsTranslationKeys, value: T) {
        switch key {
        case .holidays_near:
            holidays_near = value as? [EventDate:[PreHoliday]]
            break
        case .events:
            events = value as? [UpcomingEventType:[PreUpcomingEvent]]
            break
        case .movie_production_companies:
            _movie_production_companies = CodableOmittable(value as? MovieProductionCompaniesResponse)
            break
        }
    }
    
    public func getOmittableKeyValue(key: HomeResponseUpcomingEventsOmittableKeys) -> (any CodableOmittableProtocol)? {
        switch key {
        case .movie_production_companies: return _movie_production_companies
        }
    }
    public func setOmittableKeyValue<T: CodableOmittableProtocol>(key: HomeResponseUpcomingEventsOmittableKeys, value: T) {
        switch key {
        case .movie_production_companies:
            _movie_production_companies = value as! CodableOmittable<MovieProductionCompaniesResponse>
            break
        }
    }
}


public enum HomeResponseUpcomingEventsTranslationKeys : String, JsonableTranslationKey {
    case holidays_near
    case events
    case movie_production_companies
}
public enum HomeResponseUpcomingEventsOmittableKeys : String, JsonableOmittableKey {
    case movie_production_companies
}
