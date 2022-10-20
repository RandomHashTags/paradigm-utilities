//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseUpcomingEvents : Jsonable {
    public static func == (lhs: HomeResponseUpcomingEvents, rhs: HomeResponseUpcomingEvents) -> Bool {
        return lhs.holidays_near == rhs.holidays_near && lhs.events == rhs.events && lhs.movie_production_companies == rhs.movie_production_companies
    }
    
    public var holidays_near:[EventDate:[PreHoliday]], events:[UpcomingEventType:[PreUpcomingEvent]], movie_production_companies:MovieProductionCompaniesResponse?
    
    public init(holidays_near: [EventDate:[PreHoliday]], events: [UpcomingEventType:[PreUpcomingEvent]], movie_production_companies:MovieProductionCompaniesResponse?) {
        self.holidays_near = holidays_near
        self.events = events
        self.movie_production_companies = movie_production_companies
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(holidays_near)
        hasher.combine(events)
        hasher.combine(movie_production_companies)
    }
}
