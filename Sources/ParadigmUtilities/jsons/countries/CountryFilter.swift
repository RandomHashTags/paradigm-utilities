//
//  CountryFilter.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct CountryFilter : Jsonable {
    public typealias TranslationKeys = CountryFilterTranslationKeys
    
    public let id:String
    public var title:String
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    public func getKeyValue(key: CountryFilterTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        }
    }
    public mutating func setKeyValue<T>(key: CountryFilterTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        }
    }
}

public enum CountryFilterTranslationKeys : String, JsonableTranslationKey {
    case title
}
