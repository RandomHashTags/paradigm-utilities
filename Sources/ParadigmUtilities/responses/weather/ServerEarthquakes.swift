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
}
public struct ServerEarthquakesMagnitudes : Jsonable {
    let mag:String
    let quakes:[PreEarthquake]
}
