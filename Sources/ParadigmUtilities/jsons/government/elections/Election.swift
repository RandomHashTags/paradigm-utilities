//
//  Election.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct Election : Jsonable {
    public typealias JSONKeys = ElectionValueKeys
    
    public let id:String
    public var name:String
    public let date:EventDate, country:Country, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    
    public init(id: String, name: String, date: EventDate, country: Country, subdivision: (any SovereignStateSubdivision)? = nil, city: (any SovereignStateCity)? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
    }
    
    public func getKeyValue(key: ElectionValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .date: return date
        case .country: return country
        case .subdivision: return subdivision
        case .city: return city
        }
    }
    public mutating func setKeyValue<T>(key: ElectionValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        default:
            break
        }
    }
}

public enum ElectionValueKeys : String, JsonableKeys {
    case id
    case name
    case date
    case country
    case subdivision
    case city
}
