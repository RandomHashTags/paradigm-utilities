//
//  PreEarthquake.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation
import SwiftSovereignStates

public struct PreEarthquake : Jsonable {
    public typealias TranslationKeys = PreEarthquakeTranslationKeys
    
    public let id:String
    public var place:String
    public let city:SovereignStateCityWrapper?
    
    public init(id: String, place: String, city: (any SovereignStateCity)?) {
        self.id = id
        self.place = place
        self.city = city?.wrapped()
    }
    
    public func getKeyValue(key: PreEarthquakeTranslationKeys) -> Any? {
        switch key {
        case .place: return place
        }
    }
    public mutating func setKeyValue<T>(key: PreEarthquakeTranslationKeys, value: T) {
        switch key {
        case .place:
            place = value as! String
            break
        }
    }
}

public enum PreEarthquakeTranslationKeys : String, JsonableTranslationKey {
    case place
}
