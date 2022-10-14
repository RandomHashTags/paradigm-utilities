//
//  WeatherPreAlert.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherPreAlert : Jsonable {
    public let id:String, areas:[String], time:WeatherAlertTime, country:Country
    
    public init(id: String, areas: [String], time: WeatherAlertTime, country: Country) {
        self.id = id
        self.areas = areas
        self.time = time
        self.country = country
    }
}
