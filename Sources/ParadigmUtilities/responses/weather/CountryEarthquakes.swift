//
//  CountryEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

import SwiftSovereignStates

public extension Responses.Weather {
    struct CountryEarthquakes : Jsonable {    
        public let country:Country?
        public var subdivisions:[SubdivisionEarthquakes]
        
        public init(country: Country?, subdivisions: [SubdivisionEarthquakes]) {
            self.country = country
            self.subdivisions = subdivisions
        }
    }
}