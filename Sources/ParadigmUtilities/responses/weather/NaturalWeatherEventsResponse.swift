//
//  NaturalWeatherEventsResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public struct NaturalWeatherEventsResponse : Jsonable {
    public let severe_storms:[Country?:[PreNaturalWeatherEvent]]?, volcanoes:[Country?:[PreNaturalWeatherEvent]]?, wildfires:[Country?:[PreNaturalWeatherEvent]]?
    
    public init(severe_storms: [Country?:[PreNaturalWeatherEvent]]?, volcanoes: [Country?:[PreNaturalWeatherEvent]]?, wildfires: [Country?:[PreNaturalWeatherEvent]]?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
}
