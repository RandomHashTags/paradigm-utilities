//
//  SubdivisionStatuteItem.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteItem : Jsonable {
    public typealias ValueKeys = SubdivisionStatuteItemValueKeys
    
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
    
    public func getKeyValue(key: SubdivisionStatuteItemValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .title: return title
        case .isRepeated: return isRepealed
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SubdivisionStatuteItemValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        default:
            break
        }
    }
}

public enum SubdivisionStatuteItemValueKeys : String, JsonableValueKeys {
    case type
    case id
    case title
    case isRepeated
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title, .sources:
            return true
        default:
            return false
        }
    }
}
