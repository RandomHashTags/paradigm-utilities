//
//  NaturalWeatherEventsResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public final class NaturalWeatherEventsResponse : Jsonable {
    public static func == (lhs: NaturalWeatherEventsResponse, rhs: NaturalWeatherEventsResponse) -> Bool {
        return lhs.severe_storms == rhs.severe_storms && lhs.volcanoes == rhs.volcanoes && lhs.wildfires == rhs.wildfires
    }
    
    public var severe_storms:[Country?:[PreNaturalWeatherEvent]]?, volcanoes:[Country?:[PreNaturalWeatherEvent]]?, wildfires:[Country?:[PreNaturalWeatherEvent]]?
    
    public init(severe_storms: [Country?:[PreNaturalWeatherEvent]]?, volcanoes: [Country?:[PreNaturalWeatherEvent]]?, wildfires: [Country?:[PreNaturalWeatherEvent]]?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(severe_storms)
        hasher.combine(volcanoes)
        hasher.combine(wildfires)
    }
}
