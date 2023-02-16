//
//  ClientHoliday.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct ClientHoliday : Jsonable {
    public typealias ValueKeys = ClientHolidayValueKeys
    
    public let response_version:Int, id:String, proclamation:EventDate?
    public var name:String, description:String, aliases:[String]?
    public let image_url:String?, type:String
    public var sources:EventSources?
    
    public init(response_version: Int, id: String, began: EventDate?, name: String, description: String, aliases: [String]?, image_url: String?, type: String, sources: EventSources?) {
        self.response_version = response_version
        self.id = id
        self.proclamation = began
        self.name = name
        self.description = description
        self.aliases = aliases
        self.image_url = image_url
        self.type = type
        self.sources = sources
    }
    
    public func getKeyValue(key: ClientHolidayValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .id: return id
        case .proclamation: return proclamation
        case .name: return name
        case .description: return description
        case .aliases: return aliases
        case .image_url: return image_url
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
    case proclamation
    case name
    case description
    case aliases
    case image_url
    case type
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .name, .description, .aliases, .sources:
            return true
        default:
            return false
        }
    }
}
