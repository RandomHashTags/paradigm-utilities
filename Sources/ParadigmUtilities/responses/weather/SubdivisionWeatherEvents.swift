//
//  SubdivisionWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/31/23.
//

import Foundation
import SwiftSovereignStates

public struct SubdivisionWeatherEvents : Jsonable {    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var events:[WeatherEvent]
    
    public init(subdivision: SovereignStateSubdivisionWrapper?, events: [WeatherEvent]) {
        self.subdivision = subdivision
        self.events = events
    }
}