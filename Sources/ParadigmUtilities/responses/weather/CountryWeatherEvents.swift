//
//  CountryWeatherEvents.swift
//  
//
//  Created by Evan Anderson on 1/22/23.
//

import Foundation
import SwiftSovereignStates

public struct CountryWeatherEvents : Jsonable {    
    public let country:Country
    public var subdivisions:[SubdivisionWeatherEvents]
    
    public init(country: Country, subdivisions: [SubdivisionWeatherEvents]) {
        self.country = country
        self.subdivisions = subdivisions
    }
}