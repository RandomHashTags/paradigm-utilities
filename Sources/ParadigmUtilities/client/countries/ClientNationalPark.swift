//
//  ClientNationalPark.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientNationalPark : Jsonable {
    public typealias ValueKeys = ClientNationalParkValueKeys
    
    public let id:String
    public var name:String, description:String?
    public let imageURL:String?, country:Country, countries:[Country], subdivisions:[SovereignStateSubdivisionWrapper]
    public var sources:EventSources
    
    public init(id: String, name: String, description: String?, imageURL: String? = nil, country: Country, countries: [Country], subdivisions: [any SovereignStateSubdivision], sources: EventSources) {
        self.id = id
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.country = country
        self.countries = countries
        self.subdivisions = subdivisions.map({ $0.wrapped() })
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientNationalParkValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .description: return description
        case .imageURL: return imageURL
        case .country: return country
        case .countries: return countries
        case .subdivisions: return subdivisions
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: ClientNationalParkValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
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

public enum ClientNationalParkValueKeys : String, JsonableValueKeys {
    case id
    case name
    case description
    case imageURL
    case country
    case countries
    case subdivisions
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .description, .sources:
            return true
        default:
            return false
        }
    }
}
