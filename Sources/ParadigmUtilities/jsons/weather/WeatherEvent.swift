//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

public struct WeatherEvent : Jsonable {    
    public let type:WeatherEventType
    public let defcon:Int
    
    public init(type: WeatherEventType, defcon: Int) {
        self.type = type
        self.defcon = defcon
    }
}