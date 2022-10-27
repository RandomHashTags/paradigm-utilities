//
//  ClientVolcano.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientVolcano : Jsonable {
    public typealias TranslationKeys = ClientVolcanoTranslationKeys
    
    public let id:String
    public var name:String
    public let type:String
    public var summary:String?
    public let imageURL:String?, country:Country
    public var sources:EventSources
    
    public init(id: String, name: String, type: String, summary: String?, imageURL: String?, country: Country, sources: EventSources) {
        self.id = id
        self.name = name
        self.type = type
        self.summary = summary
        self.imageURL = imageURL
        self.country = country
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: ClientVolcanoTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .summary: return summary
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: ClientVolcanoTranslationKeys, value: T) {
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
        }
    }
}

public enum ClientVolcanoTranslationKeys : String, JsonableTranslationKey {
    case name
    case summary
    case sources
}
