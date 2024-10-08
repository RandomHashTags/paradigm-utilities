//
//  CountryNewsEvents.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import SwiftSovereignStates

public extension Responses.News {
    public struct CountryNewsEvents : Jsonable {    
        public let country:Country
        public var events:[NewsEvent]
        
        public init(country: Country, events: [NewsEvent]) {
            self.country = country
            self.events = events
        }
    }
}