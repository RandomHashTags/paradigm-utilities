//
//  PreEarthquake.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation
import SwiftSovereignStates

public struct PreEarthquake : Jsonable {
    public typealias ValueKeys = PreEarthquakeValueKeys
    
    public let id:String
    public var place:String
    public let city:SovereignStateCityWrapper?
    
    public init(id: String, place: String, city: (any SovereignStateCity)?) {
        self.id = id
        self.place = place
        self.city = city?.wrapped()
    }
    
    public func getKeyValue(key: PreEarthquakeValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .place: return place
        case .city: return city
        }
    }
    public mutating func setKeyValue<T>(key: PreEarthquakeValueKeys, value: T) {
        switch key {
        case .place:
            place = value as! String
            break
        default:
            break
        }
    }
}

public enum PreEarthquakeValueKeys : String, JsonableValueKeys {
    case id
    case place
    case city
    
    public var is_translatable : Bool {
        switch self {
        case .place:
            return true
        default:
            return false
        }
    }
}
