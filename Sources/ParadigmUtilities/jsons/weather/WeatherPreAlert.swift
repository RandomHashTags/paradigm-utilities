//
//  WeatherPreAlert.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherPreAlert : Jsonable {
    public let id:String, areas:Set<String>, time:WeatherAlertTime, country:Country, subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, areas: Set<String>, time: WeatherAlertTime, country: Country, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.areas = areas
        self.time = time
        self.country = country
        self.subdivision = subdivision?.wrapped()
    }
}
