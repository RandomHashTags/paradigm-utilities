//
//  SubdivisionStatuteItem.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteItem : Jsonable {
    public typealias JSONKeys = SubdivisionStatuteItemValueKeys
    
    public let type:SubdivisionLegislationType, id:String
    public var title:String
    public let is_repealed:Bool
    public var sources:EventSources
    
    public init(type: SubdivisionLegislationType, id: String, title: String, is_repealed: Bool, sources: EventSources) {
        self.type = type
        self.id = id
        self.title = title
        self.is_repealed = is_repealed
        self.sources = sources
    }
    
    public func getKeyValue(key: SubdivisionStatuteItemValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .title: return title
        case .is_repeated: return is_repealed
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

public enum SubdivisionStatuteItemValueKeys : String, JsonableKeys {
    case type
    case id
    case title
    case is_repeated
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .title, .sources:
            return true
        default:
            return false
        }
    }
}
