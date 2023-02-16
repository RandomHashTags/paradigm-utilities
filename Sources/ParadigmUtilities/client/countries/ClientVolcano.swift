//
//  ClientVolcano.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientVolcano : Jsonable {
    public typealias ValueKeys = ClientVolcanoValueKeys
    
    public let id:String
    public var name:String
    public let type:String
    public var summary:String?
    public let image_url:String?, country:Country
    public var sources:EventSources
    
    public init(id: String, name: String, type: String, summary: String?, image_url: String?, country: Country, sources: EventSources) {
        self.id = id
        self.name = name
        self.type = type
        self.summary = summary
        self.image_url = image_url
        self.country = country
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientVolcanoValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .type: return type
        case .summary: return summary
        case .image_url: return image_url
        case .country: return country
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: ClientVolcanoValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .summary:
            summary = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum ClientVolcanoValueKeys : String, JsonableValueKeys {
    case id
    case name
    case type
    case summary
    case image_url
    case country
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .name, .summary, .sources:
            return true
        default:
            return false
        }
    }
}
