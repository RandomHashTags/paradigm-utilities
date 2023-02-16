//
//  PreNaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNaturalWeatherEvent : Jsonable {
    public typealias ValueKeys = PreNaturalWeatherEventValueKeys
    
    public let id:String
    public var place:String, tag:String?
    public let country:Country?
    public let subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, place: String, tag: String?, country: Country?, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.place = place
        self.tag = tag
        self.country = country
        self.subdivision = subdivision?.wrapped()
    }
    
    public func getKeyValue(key: PreNaturalWeatherEventValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .place: return place
        case .tag: return tag
        case .country: return country
        case .subdivision: return subdivision
        }
    }
    public mutating func setKeyValue<T>(key: PreNaturalWeatherEventValueKeys, value: T) {
        switch key {
        case .place:
            place = value as! String
            break
        case .tag:
            tag = value as? String
            break
        default:
            break
        }
    }
}

public enum PreNaturalWeatherEventValueKeys : String, JsonableValueKeys {
    case id
    case place
    case tag
    case country
    case subdivision
    
    public var is_translatable : Bool {
        switch self {
        case .place, .tag:
            return true
        default:
            return false
        }
    }
}
