//
//  ClientHoliday.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct ClientHoliday : Jsonable {
    public typealias ValueKeys = ClientHolidayValueKeys
    
    public let response_version:Int, id:String
    public var name:String, description:String, aliases:[String]?
    public let imageURL:String?, type:String
    public var sources:EventSources?
    
    public init(response_version: Int, id: String, name: String, description: String, aliases: [String]?, imageURL: String?, type: String, sources: EventSources?) {
        self.response_version = response_version
        self.id = id
        self.name = name
        self.description = description
        self.aliases = aliases
        self.imageURL = imageURL
        self.type = type
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientHolidayValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .id: return id
        case .name: return name
        case .description: return description
        case .aliases: return aliases
        case .imageURL: return imageURL
        case .type: return type
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: ClientHolidayValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .description:
            description = value as! String
            break
        case .aliases:
            aliases = value as? [String]
            break
        default:
            break
        }
    }
}

public enum ClientHolidayValueKeys : String, JsonableValueKeys {
    case response_version
    case id
    case name
    case description
    case aliases
    case imageURL
    case type
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .description, .aliases, .sources:
            return true
        default:
            return false
        }
    }
}
