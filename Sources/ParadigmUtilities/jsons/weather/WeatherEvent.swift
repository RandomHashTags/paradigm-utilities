//
//  WeatherEvent.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherEvent : Jsonable {
    let event:String, defcon:Int
}
