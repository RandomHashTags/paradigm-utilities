//
//  ClientNationalPark.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientNationalPark : Jsonable {
    public typealias TranslationKeys = ClientNationalParkTranslationKeys
    
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
    
    public func getTranslationKeyValue(key: ClientNationalParkTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .description: return description
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: ClientNationalParkTranslationKeys, value: T) {
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
        }
    }
}

public enum ClientNationalParkTranslationKeys : String, JsonableTranslationKey {
    case name
    case description
    case sources
}
