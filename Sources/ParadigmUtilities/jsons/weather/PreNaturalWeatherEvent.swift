//
//  PreNaturalWeatherEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNaturalWeatherEvent : Jsonable {
    public typealias TranslationKeys = PreNaturalWeatherEventTranslationKeys
    
    public let id:String
    public var place:String, tag:String?
    public let subdivision:SovereignStateSubdivisionWrapper?
    
    public init(id: String, place: String, tag: String?, subdivision: (any SovereignStateSubdivision)?) {
        self.id = id
        self.place = place
        self.tag = tag
        self.subdivision = subdivision?.wrapped()
    }
    
    public func getKeyValue(key: PreNaturalWeatherEventTranslationKeys) -> Any? {
        switch key {
        case .place: return place
        case .tag: return tag
        }
    }
    public mutating func setKeyValue<T>(key: PreNaturalWeatherEventTranslationKeys, value: T) {
        switch key {
        case .place:
            place = value as! String
            break
        case .tag:
            tag = value as? String
            break
        }
    }
}

public enum PreNaturalWeatherEventTranslationKeys : String, JsonableTranslationKey {
    case place
    case tag
}
