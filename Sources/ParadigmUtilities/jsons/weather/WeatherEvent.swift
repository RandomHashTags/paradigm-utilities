//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherEvent : Jsonable {
    public let id:String, event:String, defcon:Int
    
    public init(id: String, event: String, defcon: Int) {
        self.id = id
        self.event = event
        self.defcon = defcon
    }
}
