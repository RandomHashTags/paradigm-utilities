//
//  WeatherZone.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation
import GEOSwift

public struct WeatherZone : Jsonable {
    public let name:String, nameSuffix:String?, subdivision:String, geometry:Geometry
    
    public init(name: String, nameSuffix: String?, subdivision: String, geometry: Geometry) {
        self.name = name
        self.nameSuffix = nameSuffix
        self.subdivision = subdivision
        self.geometry = geometry
    }
}
