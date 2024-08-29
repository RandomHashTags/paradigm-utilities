//
//  CountryNaturalWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import SwiftSovereignStates

public struct CountryNaturalWeatherEvents : Jsonable {    
    public let country:Country?
    public var events:[PreNaturalWeatherEvent]
    
    public init(country: Country?, events: [PreNaturalWeatherEvent]) {
        self.country = country
        self.events = events
    }
}