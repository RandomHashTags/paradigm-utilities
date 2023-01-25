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
    
    public init(id: String, place: String) {
        self.id = id
        self.place = place
    }
    
    public func getKeyValue(key: PreEarthquakeValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .place: return place
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
    
    public func isTranslatable() -> Bool {
        switch self {
        case .place:
            return true
        default:
            return false
        }
    }
}
