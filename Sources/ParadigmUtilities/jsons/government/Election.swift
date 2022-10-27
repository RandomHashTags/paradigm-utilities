//
//  Election.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct Election : Jsonable {
    public typealias TranslationKeys = ElectionTranslationKeys
    
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
    
    public func getKeyValue(key: ElectionTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        }
    }
    public mutating func setKeyValue<T>(key: ElectionTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        }
    }
}

public enum ElectionTranslationKeys : String, JsonableTranslationKey {
    case name
}
