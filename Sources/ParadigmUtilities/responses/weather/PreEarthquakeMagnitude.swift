//
//  PreEarthquakeMagnitude.swift
//  
//
//  Created by Evan Anderson on 1/25/23.
//

public struct PreEarthquakeMagnitude : Jsonable {    
    public let mag:String
    public var quakes:[PreEarthquake]
    
    public init(mag: String, quakes: [PreEarthquake]) {
        self.mag = mag
        self.quakes = quakes
    }
}