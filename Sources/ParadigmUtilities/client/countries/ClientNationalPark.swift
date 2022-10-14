//
//  ClientNationalPark.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientNationalPark : Jsonable {
    public let id:String, name:String, imageURL:String?, country:Country, countries:[Country], subdivisions:[SovereignStateSubdivisionWrapper], sources:EventSources
    
    public init(id: String, name: String, imageURL: String? = nil, country: Country, countries: [Country], subdivisions: [any SovereignStateSubdivision], sources: EventSources) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
        self.countries = countries
        self.subdivisions = subdivisions.map({ SovereignStateSubdivisionWrapper($0) })
        self.sources = sources
    }
}
