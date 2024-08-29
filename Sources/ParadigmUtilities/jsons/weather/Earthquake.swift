//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {    
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    public var cause:String
    public let magnitude:Float, place:String, exact_time:Date, last_updated:Date, depth_km:Float?, location:Location
    public var sources:EventSources
    
    public init(country: Country?, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, cause: String, magnitude: Float, place: String, exact_time: Date, last_updated: Date, depth_km: Float?, location: Location, sources: EventSources) {
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.cause = cause
        self.magnitude = magnitude
        self.place = place
        self.exact_time = exact_time
        self.last_updated = last_updated
        self.depth_km = depth_km
        self.location = location
        self.sources = sources
    }
}