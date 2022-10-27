//
//  ClientHoliday.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct ClientHoliday : Jsonable {
    public typealias TranslationKeys = ClientHolidayTranslationKeys
    
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
    
    public func getKeyValue(key: ClientHolidayTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .description: return description
        case .aliases: return aliases
        }
    }
    public mutating func setKeyValue<T>(key: ClientHolidayTranslationKeys, value: T) {
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
        }
    }
}

public enum ClientHolidayTranslationKeys : String, JsonableTranslationKey {
    case name
    case description
    case aliases
}
