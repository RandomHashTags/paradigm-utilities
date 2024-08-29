//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension HomeResponse {
    struct UpcomingEvents : HomeResponseProtocol {    
        public var holidays_near:[UpcomingEventDateHolidays]?
        public var events:[UpcomingEventTypeEvents]?
        public var movie_production_companies:MovieProductionCompaniesResponse?
            
        public init(holidays_near: [UpcomingEventDateHolidays]?, events: [UpcomingEventTypeEvents]?, movie_production_companies: MovieProductionCompaniesResponse?) {
            self.holidays_near = holidays_near
            self.events = events
            self.movie_production_companies = movie_production_companies
        }
    }
}