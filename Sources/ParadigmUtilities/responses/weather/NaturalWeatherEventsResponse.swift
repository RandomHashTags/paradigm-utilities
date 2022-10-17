//
//  NaturalWeatherEventsResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct NaturalWeatherEventsResponse : Jsonable {
    public let severe_storms:[PreNaturalEvent]?, volcanoes:[PreNaturalEvent]?, wildfires:[PreNaturalEvent]?
    
    public init(severe_storms: [PreNaturalEvent]?, volcanoes: [PreNaturalEvent]?, wildfires: [PreNaturalEvent]?) {
        self.severe_storms = severe_storms
        self.volcanoes = volcanoes
        self.wildfires = wildfires
    }
}
