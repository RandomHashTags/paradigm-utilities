//
//  ServerEarthquakes.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct EarthquakesResponse : Jsonable {
    public let country:Country
    public let magnitudes:[EarthquakesResponseMagnitudes]
    
    public init(country: Country, magnitudes: [EarthquakesResponseMagnitudes]) {
        self.country = country
        self.magnitudes = magnitudes
    }
}
public struct EarthquakesResponseMagnitudes : Jsonable {
    public let mag:String, quakes:[PreEarthquake]
    
    public init(mag: String, quakes: [PreEarthquake]) {
        self.mag = mag
        self.quakes = quakes
    }
}
