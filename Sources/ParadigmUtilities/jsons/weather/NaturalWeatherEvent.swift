//
//  NaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct NaturalWeatherEvent : Jsonable {
    public typealias JSONKeys = NaturalWeatherEventValueKeys
    
    public let id:String, place:String, country:Country?, subdivision:SovereignStateSubdivisionWrapper?, location:Location?
    public var description:String?, sources:EventSources
    
    public init(id: String, place: String, country: Country?, subdivision: (any SovereignStateSubdivision)?, location: Location?, description: String?, sources: EventSources) {
        self.id = id
        self.place = place
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.location = location
        self.description = description
        self.sources = sources
    }
    
    public func getKeyValue(key: NaturalWeatherEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .place: return place
        case .country: return country
        case .subdivision: return subdivision
        case .location: return location
        case .description: return description
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NaturalWeatherEventValueKeys, value: T) {
        switch key {
        case .description:
            description = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum NaturalWeatherEventValueKeys : String, JsonableKeys {
    case id
    case place
    case country
    case subdivision
    case location
    case description
    case sources
}
