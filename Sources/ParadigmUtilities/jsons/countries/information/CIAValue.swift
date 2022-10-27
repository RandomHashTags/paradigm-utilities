//
//  CIAValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct CIAValue : SovereignStateInformationValue {
    public typealias TranslationKeys = CIAValueTranslationKeys
    
    public let id:String
    public var title:String, value:String, sources:EventSources?
    
    public init(id: String, title: String, value: String, sources: EventSources?) {
        self.id = id
        self.title = title
        self.value = value
        self.sources = sources
    }
    
    public func getKeyValue(key: CIAValueTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        case .value: return value
        case .sources: return sources
        }
    }
    
    public mutating func setKeyValue<T>(key: CIAValueTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .value:
            self.value = value as! String
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum CIAValueTranslationKeys : String, JsonableTranslationKey {
    case title
    case value
    case sources
}
