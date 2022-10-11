//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {
    let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?, cause:String, magnitude:Float, place:String, exactTimeMilliseconds:Int64, lastUpdated:Int64, depthKM:Float?, location:Location, sources:EventSources
    
    init(country: Country?, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, cause: String, magnitude: Float, place: String, exactTimeMilliseconds: Int64, lastUpdated: Int64, depthKM: Float?, location: Location, sources: EventSources) {
        self.country = country
        self.subdivision = subdivision != nil ? SovereignStateSubdivisionWrapper(subdivision!) : nil
        self.city = city != nil ? SovereignStateCityWrapper(city!) : nil
        self.cause = cause
        self.magnitude = magnitude
        self.place = place
        self.exactTimeMilliseconds = exactTimeMilliseconds
        self.lastUpdated = lastUpdated
        self.depthKM = depthKM
        self.location = location
        self.sources = sources
    }
}
