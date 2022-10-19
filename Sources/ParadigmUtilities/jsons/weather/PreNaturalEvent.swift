//
//  PreNaturalEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNaturalEvent : Jsonable {
    public let id:String, type:String, place:String, subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, type: String, place: String, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.type = type
        self.place = place
        self.subdivision = subdivision?.wrapped()
    }
}
