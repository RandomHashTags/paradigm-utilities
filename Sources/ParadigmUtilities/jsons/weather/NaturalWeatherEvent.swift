//
//  NaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct NaturalWeatherEvent : Jsonable {
    public let id:String, place:String, country:Country?, subdivision:SovereignStateSubdivisionWrapper?, location:Location?, description:String?, sources:EventSources
    
    public init(id: String, place: String, country: Country?, subdivision: (any SovereignStateSubdivision)?, location: Location?, description: String?, sources: EventSources) {
        self.id = id
        self.place = place
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.location = location
        self.description = description
        self.sources = sources
    }
}
