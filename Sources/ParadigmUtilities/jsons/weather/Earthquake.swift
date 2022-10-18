//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?, cause:String, magnitude:Float, place:String, exactTimeMilliseconds:Int64, lastUpdated:Int64, depthKM:Float?, location:Location, sources:EventSources
    
    public init(country: Country?, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, cause: String, magnitude: Float, place: String, exactTimeMilliseconds: Int64, lastUpdated: Int64, depthKM: Float?, location: Location, sources: EventSources) {
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
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