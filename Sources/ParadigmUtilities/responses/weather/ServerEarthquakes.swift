//
//  ServerEarthquakes.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ServerEarthquakes : Jsonable {
    let country:String
    let magnitudes:[ServerEarthquakesMagnitudes]
    
    public init(country: String, magnitudes: [ServerEarthquakesMagnitudes]) {
        self.country = country
        self.magnitudes = magnitudes
    }
}
public struct ServerEarthquakesMagnitudes : Jsonable {
    let mag:String
    let quakes:[PreEarthquake]
    
    public init(mag: String, quakes: [PreEarthquake]) {
        self.mag = mag
        self.quakes = quakes
    }
}
