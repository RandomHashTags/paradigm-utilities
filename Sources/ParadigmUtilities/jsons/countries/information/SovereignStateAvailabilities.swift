//
//  SovereignStateAvailabilities.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateAvailabilities : Jsonable {
    public typealias JSONKeys = SovereignStateAvailabilitiesValueKeys
    
    public let image_url_prefix:String
    public var availabilities:[ClientSovereignStateAvailability]
    
    public init(image_url_prefix: String, availabilities: [ClientSovereignStateAvailability]) {
        self.image_url_prefix = image_url_prefix
        self.availabilities = availabilities
    }
    
    public func getKeyValue(key: SovereignStateAvailabilitiesValueKeys) -> Any? {
        switch key {
        case .image_url_prefix: return image_url_prefix
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

public enum SovereignStateAvailabilitiesValueKeys : String, JsonableKeys {
    case image_url_prefix
    case availabilities
}
