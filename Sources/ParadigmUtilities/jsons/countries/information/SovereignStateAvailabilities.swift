//
//  SovereignStateAvailabilities.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateAvailabilities : Jsonable {
    public typealias ValueKeys = SovereignStateAvailabilitiesValueKeys
    
    public let imageURLPrefix:String
    public var availabilities:[ClientSovereignStateAvailability]
    
    public init(imageURLPrefix: String, availabilities: [ClientSovereignStateAvailability]) {
        self.imageURLPrefix = imageURLPrefix
        self.availabilities = availabilities
    }
    
    public func getKeyValue(key: SovereignStateAvailabilitiesValueKeys) -> Any? {
        switch key {
        case .imageURLPrefix: return imageURLPrefix
        case .availabilities: return availabilities
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateAvailabilitiesValueKeys, value: T) {
        switch key {
        case .availabilities:
            availabilities = value as! [ClientSovereignStateAvailability]
            break
        default:
            break
        }
    }
}

public enum SovereignStateAvailabilitiesValueKeys : String, JsonableValueKeys {
    case imageURLPrefix
    case availabilities
    
    public func isTranslatable() -> Bool {
        switch self {
        case .availabilities:
            return true
        default:
            return false
        }
    }
}
