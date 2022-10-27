//
//  PreMovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PreMovieProductionCompany : MovieProductionCompanyProtocol {
    public typealias TranslationKeys = PreMovieProductionCompanyTranslationKeys
    
    public let id:String
    public var name:String, aliases:[String]?
    public let imageURL:String?
    
    public init(id: String, name: String, aliases: [String]?, imageURL: String?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.imageURL = imageURL
    }
    
    public func getKeyValue(key: PreMovieProductionCompanyTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .aliases: return aliases
        }
    }
    public mutating func setKeyValue<T>(key: PreMovieProductionCompanyTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .aliases:
            aliases = value as? [String]
            break
        }
    }
}

public enum PreMovieProductionCompanyTranslationKeys : String, JsonableTranslationKey {
    case name
    case aliases
}
