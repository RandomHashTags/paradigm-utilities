//
//  PreNaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import SwiftSovereignStates

public struct PreNaturalWeatherEvent : Jsonable {    
    public let id:String
    public var place:String, tag:String?
    public let country:Country?
    public let subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, place: String, tag: String?, country: Country?, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.place = place
        self.tag = tag
        self.country = country
        self.subdivision = subdivision?.wrapped()
    }
}