//
//  CountryWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import SwiftSovereignStates

public extension Responses.Weather {
    struct CountryWeatherEvents : Jsonable {    
        public let country:Country
        public var subdivisions:[SubdivisionWeatherEvents]
        
        public init(country: Country, subdivisions: [SubdivisionWeatherEvents]) {
            self.country = country
            self.subdivisions = subdivisions
        }
    }
}