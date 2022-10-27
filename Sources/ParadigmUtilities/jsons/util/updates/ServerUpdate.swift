//
//  ServerUpdate.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation

public struct ServerUpdate : Jsonable {
    public typealias TranslationKeys = ServerUpdateTranslationKeys
    
    public let type:UpdateType
    public var summary:String, related:UpdateRelatedContent?
    public let requiresPremium:Bool?
    
    public init(type: UpdateType, summary: String, related: UpdateRelatedContent? = nil, requiresPremium: Bool = false) {
        self.type = type
        self.summary = summary
        self.related = related
        self.requiresPremium = requiresPremium ? true : nil
    }
    
    public func getKeyValue(key: ServerUpdateTranslationKeys) -> Any? {
        switch key {
        case .summary: return summary
        case .related: return related
        }
    }
    public mutating func setKeyValue<T>(key: ServerUpdateTranslationKeys, value: T) {
        switch key {
        case .summary:
            summary = value as! String
            break
        case .related:
            related = value as? UpdateRelatedContent
            break
        }
    }
}

public enum ServerUpdateTranslationKeys : String, JsonableTranslationKey {
    case summary
    case related
}
