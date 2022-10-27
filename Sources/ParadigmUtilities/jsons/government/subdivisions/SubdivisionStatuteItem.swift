//
//  SubdivisionStatuteItem.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteItem : Jsonable {
    public typealias TranslationKeys = SubdivisionStatuteItemTranslationKeys
    
    public let type:SubdivisionLegislationType, id:String
    public var title:String
    public let isRepealed:Bool
    public var sources:EventSources
    
    public init(type: SubdivisionLegislationType, id: String, title: String, isRepealed: Bool, sources: EventSources) {
        self.type = type
        self.id = id
        self.title = title
        self.isRepealed = isRepealed
        self.sources = sources
    }
    
    public func getKeyValue(key: SubdivisionStatuteItemTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SubdivisionStatuteItemTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum SubdivisionStatuteItemTranslationKeys : String, JsonableTranslationKey {
    case title
    case sources
}
