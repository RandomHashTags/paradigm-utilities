//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : Jsonable {
    public typealias JSONKeys = ClientSovereignStateAvailabilityValueKeys
    
    public let info:SovereignStateInfo, primary_category:SovereignStateAvailabilityCategory, image_url:String?, value:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, primary_category: SovereignStateAvailabilityCategory, image_url: String?, value: Bool, sources: EventSources?) {
        self.info = info
        self.primary_category = primary_category
        self.image_url = image_url
        self.value = value
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientSovereignStateAvailabilityValueKeys) -> Any? {
        switch key {
        case .info: return info
        case .primary_category: return primary_category
        case .image_url: return image_url
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

public enum ClientSovereignStateAvailabilityValueKeys : String, JsonableKeys {
    case info
    case primary_category
    case image_url
    case value
    case sources
}
