//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {
    public typealias ValueKeys = EarthquakeValueKeys
    
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    public var cause:String
    public let magnitude:Float, place:String, exactTimeMilliseconds:Int64, lastUpdated:Int64, depthKM:Float?, location:Location
    public var sources:EventSources
    
    public init(country: Country?, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, cause: String, magnitude: Float, place: String, exactTimeMilliseconds: Int64, lastUpdated: Int64, depthKM: Float?, location: Location, sources: EventSources) {
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.cause = cause
        self.magnitude = magnitude
        self.place = place
        self.exactTimeMilliseconds = exactTimeMilliseconds
        self.lastUpdated = lastUpdated
        self.depthKM = depthKM
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
        case .exactTimeMilliseconds: return exactTimeMilliseconds
        case .lastUpdated: return lastUpdated
        case .depthKM: return depthKM
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

public enum EarthquakeValueKeys : String, JsonableValueKeys {
    case country
    case subdivision
    case city
    case cause
    case magnitude
    case place
    case exactTimeMilliseconds
    case lastUpdated
    case depthKM
    case location
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .cause, .sources:
            return true
        default:
            return false
        }
    }
}
