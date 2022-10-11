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
}
