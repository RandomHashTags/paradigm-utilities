//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : Jsonable {
    public typealias ValueKeys = ClientSovereignStateAvailabilityValueKeys
    
    public let info:SovereignStateInfo, primaryCategory:SovereignStateAvailabilityCategory, imageURL:String?, value:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, primaryCategory: SovereignStateAvailabilityCategory, imageURL: String?, value: Bool, sources: EventSources?) {
        self.info = info
        self.primaryCategory = primaryCategory
        self.imageURL = imageURL
        self.value = value
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientSovereignStateAvailabilityValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .primaryCategory: return primaryCategory
        case .imageURL: return imageURL
        case .value: return value
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: ClientSovereignStateAvailabilityValueKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum ClientSovereignStateAvailabilityValueKeys : String, JsonableValueKeys {
    case info
    case primaryCategory
    case imageURL
    case value
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .sources:
            return true
        default:
            return false
        }
    }
}
