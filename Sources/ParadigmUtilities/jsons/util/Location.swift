//
//  Location.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation
import CoreLocation

public struct Location : Jsonable {
    public let longitude:Double, latitude:Double
    
    public init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode([longitude, latitude])
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let values:[Double] = try container.decode([Double].self)
        longitude = values[0]
        latitude = values[1]
    }
    
    public var core_location : CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
