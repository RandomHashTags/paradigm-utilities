//
//  Election.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct Election : Jsonable {
    public let id:String, name:String, date:EventDate, country:Country, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    
    public init(id: String, name: String, date: EventDate, country: Country, subdivision: (any SovereignStateSubdivision)? = nil, city: (any SovereignStateCity)? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
    }
}
