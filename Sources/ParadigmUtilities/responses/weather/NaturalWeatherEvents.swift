//
//  NaturalWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import SwiftSovereignStates

public extension Responses.Weather {
    struct NaturalWeatherEvents : Jsonable {    
        public var severe_storms:[CountryNaturalWeatherEvents]?, volcanoes:[CountryNaturalWeatherEvents]?, wildfires:[CountryNaturalWeatherEvents]?
        
        public init(severe_storms: [CountryNaturalWeatherEvents]?, volcanoes: [CountryNaturalWeatherEvents]?, wildfires: [CountryNaturalWeatherEvents]?) {
            self.severe_storms = severe_storms
            self.volcanoes = volcanoes
            self.wildfires = wildfires
        }
    }
}