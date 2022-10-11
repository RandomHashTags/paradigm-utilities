//
//  PreEarthquake.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public struct PreEarthquake : Jsonable {
    public let id:String, place:String
    
    public init(id: String, place: String) {
        self.id = id
        self.place = place
    }
}
