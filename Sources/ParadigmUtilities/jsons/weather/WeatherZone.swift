//
//  WeatherZone.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation
import SwiftSovereignStates
import GEOSwift

public struct WeatherZone : Jsonable {
    public let name:String, nameSuffix:String?, subdivision:SovereignStateSubdivisionWrapper?, geometry:Geometry
    
    public init(name: String, nameSuffix: String?, subdivision: (any SovereignStateSubdivision)?, geometry: Geometry) {
        self.name = name
        self.nameSuffix = nameSuffix
        self.subdivision = subdivision?.wrapped()
        self.geometry = geometry
    }
}
