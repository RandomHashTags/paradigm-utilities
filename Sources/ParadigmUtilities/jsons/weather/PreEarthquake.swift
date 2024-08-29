//
//  PreEarthquake.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import SwiftSovereignStates

public struct PreEarthquake : Jsonable {    
    public let id:String
    public var place:String
    public let city:SovereignStateCityWrapper?
    
    public init(id: String, place: String, city: (any SovereignStateCity)?) {
        self.id = id
        self.place = place
        self.city = city?.wrapped()
    }
}