//
//  PreElection.swift
//  
//
//  Created by Evan Anderson on 10/31/22.
//

import Foundation
import SwiftSovereignStates

public struct PreElection : Jsonable {
    public typealias TranslationKeys = PreElectionTranslationKeys
    
    public let id:String
    public var name:String
    public let date:EventDate, country:Country
    
    public init(id: String, name: String, date: EventDate, country: Country) {
        self.id = id
        self.name = name
        self.date = date
        self.country = country
    }
    
    public func getTranslationKeyValue(key: PreElectionTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        }
    }
    public mutating func setTranslationKeyValue<T>(key: PreElectionTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        }
    }
}

public enum PreElectionTranslationKeys : String, JsonableTranslationKey {
    case name
}
