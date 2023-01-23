//
//  ServerUpdate.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation

public struct ServerUpdate : Jsonable {
    public typealias ValueKeys = ServerUpdateValueKeys
    
    public let type:UpdateType
    public var summary:String, related:UpdateRelatedContent?
    public let requires_premium:Bool?
    
    public init(type: UpdateType, summary: String, related: UpdateRelatedContent? = nil, requires_premium: Bool = false) {
        self.type = type
        self.summary = summary
        self.related = related
        self.requires_premium = requires_premium ? true : nil
    }
    
    public func getKeyValue(key: ServerUpdateValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .summary: return summary
        case .related: return related
        case .requires_premium: return requires_premium
        }
    }
    public mutating func setKeyValue<T>(key: ServerUpdateValueKeys, value: T) {
        switch key {
        case .summary:
            summary = value as! String
            break
        case .related:
            related = value as? UpdateRelatedContent
            break
        default:
            break
        }
    }
}

public enum ServerUpdateValueKeys : String, JsonableValueKeys {
    case type
    case summary
    case related
    case requires_premium
    
    public func isTranslatable() -> Bool {
        switch self {
        case .summary, .related:
            return true
        default:
            return false
        }
    }
}
