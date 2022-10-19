//
//  NaturalWeatherEventsResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public struct NaturalWeatherEventsResponse : Jsonable {
    public let severe_storms:[Country?:[PreNaturalEvent]]?, volcanoes:[Country?:[PreNaturalEvent]]?, wildfires:[Country?:[PreNaturalEvent]]?
    
    public init(severe_storms: [Country?:[PreNaturalEvent]]?, volcanoes: [Country?:[PreNaturalEvent]]?, wildfires: [Country?:[PreNaturalEvent]]?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
}
