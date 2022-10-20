//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseUpcomingEvents : Jsonable {
    public var holidays_near:[EventDate:[PreHoliday]], events:[UpcomingEventType:[PreUpcomingEvent]], movie_production_companies:MovieProductionCompaniesResponse?
    
    public init(holidays_near: [EventDate:[PreHoliday]], events: [UpcomingEventType:[PreUpcomingEvent]], movie_production_companies:MovieProductionCompaniesResponse?) {
        self.holidays_near = holidays_near
        self.events = events
        self.movie_production_companies = movie_production_companies
    }
}
