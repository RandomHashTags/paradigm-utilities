//
//  HomeResponseUpcomingEvents.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension Responses.UpcomingEvents {
    struct Home : HomeResponseProtocol {    
        public var events:[Responses.UpcomingEvents.TypeEvents]?
        public var movie_production_companies:Responses.UpcomingEvents.MovieProductionCompanies?
            
        public init(events: [Responses.UpcomingEvents.TypeEvents]?, movie_production_companies: Responses.UpcomingEvents.MovieProductionCompanies?) {
            self.events = events
            self.movie_production_companies = movie_production_companies
        }
    }
}