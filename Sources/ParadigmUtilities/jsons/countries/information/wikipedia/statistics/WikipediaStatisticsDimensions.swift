//
//  WikipediaStatisticsDimensions.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

public struct WikipediaStatisticsDimensions : Jsonable {
    public typealias TranslationKeys = WikipediaStatisticsDimensionsTranslationKeys
    
    public var length:String?, width:String?
    
    public init(length: String?, width: String?) {
        self.length = length
        self.width = width
    }
    
    public func getKeyValue(key: WikipediaStatisticsDimensionsTranslationKeys) -> Any? {
        switch key {
        case .length: return length
        case .width: return width
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaStatisticsDimensionsTranslationKeys, value: T) {
        switch key {
        case .length:
            length = value as? String
            break
        case .width:
            width = value as? String
            break
        }
    }
}

public enum WikipediaStatisticsDimensionsTranslationKeys : String, JsonableTranslationKey {
    case length
    case width
}
