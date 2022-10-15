//
//  ServerEarthquakes.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct EarthquakesResponse : Jsonable {
    let country:String
    let magnitudes:[EarthquakesResponseMagnitudes]
    
    public init(country: String, magnitudes: [EarthquakesResponseMagnitudes]) {
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
