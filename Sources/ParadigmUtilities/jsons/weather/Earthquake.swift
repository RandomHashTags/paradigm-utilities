//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {
    public typealias JSONKeys = EarthquakeValueKeys
    
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    public var cause:String
    public let magnitude:Float, place:String, exact_time:Int64, last_updated:Int64, depth_km:Float?, location:Location
    public var sources:EventSources
    
    public init(country: Country?, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, cause: String, magnitude: Float, place: String, exact_time: Int64, last_updated: Int64, depth_km: Float?, location: Location, sources: EventSources) {
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.cause = cause
        self.magnitude = magnitude
        self.place = place
        self.exact_time = exact_time
        self.last_updated = last_updated
        self.depth_km = depth_km
        self.location = location
        self.sources = sources
    }
    
    public func getKeyValue(key: EarthquakeValueKeys) -> Any? {
        switch key {
        case .country: return country
        case .subdivision: return subdivision
        case .city: return city
        case .cause: return cause
        case .magnitude: return magnitude
        case .place: return place
        case .exact_time: return exact_time
        case .last_updated: return last_updated
        case .depth_km: return depth_km
        case .location: return location
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: EarthquakeValueKeys, value: T) {
        switch key {
        case .cause:
            cause = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum EarthquakeValueKeys : String, JsonableKeys {
    case country
    case subdivision
    case city
    case cause
    case magnitude
    case place
    case exact_time
    case last_updated
    case depth_km
    case location
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .cause, .sources:
            return true
        default:
            return false
        }
    }
}
