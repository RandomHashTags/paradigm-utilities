//
//  PreNaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNaturalWeatherEvent : Jsonable {
    public let id:String, place:String, tag:String?, subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, place: String, tag: String?, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.place = place
        self.tag = tag
        self.subdivision = subdivision?.wrapped()
    }
}
