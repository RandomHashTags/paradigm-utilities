//
//  Earthquake.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct Earthquake : Jsonable {
    public typealias TranslationKeys = EarthquakeTranslationKeys
    
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
    
    public func getKeyValue(key: EarthquakeTranslationKeys) -> Any? {
        switch key {
        case .cause: return cause
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: EarthquakeTranslationKeys, value: T) {
        switch key {
        case .cause:
            cause = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum EarthquakeTranslationKeys : String, JsonableTranslationKey {
    case cause
    case sources
}
