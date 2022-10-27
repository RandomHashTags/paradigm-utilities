//
//  SovereignStateInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoValue : Jsonable {
    public typealias TranslationKeys = SovereignStateInfoValueTranslationKeys
    
    public var title:String, value:String, description:String?
    
    public init(title: String, value: String, description: String?) {
        self.title = title
        self.value = value
        self.description = description
    }
    
    public func getTranslationKeyValue(key: SovereignStateInfoValueTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        case .value: return value
        case .description: return description
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateInfoValueTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .value:
            self.value = value as! String
            break
        case .description:
            description = value as? String
            break
        }
    }
}

public enum SovereignStateInfoValueTranslationKeys : String, JsonableTranslationKey {
    case title
    case value
    case description
}
