//
//  PreNaturalEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNaturalEvent : Jsonable {
    public let id:String, type:String, place:String, country:Country?
    
    public init(id: String, type: String, place: String, country: Country?) {
        self.id = id
        self.type = type
        self.place = place
        self.country = country
    }
}
