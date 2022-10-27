//
//  MovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct MovieProductionCompany : MovieProductionCompanyProtocol {
    public typealias TranslationKeys = MovieProductionCompanyTranslationKeys
    
    public let response_version:Int, id:String
    public var name:String, aliases:[String]?, description:String
    public let imageURL:String?
    public var sources:EventSources
    
    public init(response_version: Int, id: String, name: String, aliases: [String]?, description: String, imageURL: String?, sources: EventSources) {
        self.response_version = response_version
        self.id = id
        self.name = name
        self.aliases = aliases
        self.description = description
        self.imageURL = imageURL
        self.sources = sources
    }
    
    public func toPreMovieProductionCompany() -> PreMovieProductionCompany {
        return PreMovieProductionCompany(id: id, name: name, aliases: aliases, imageURL: imageURL)
    }
    
    public func getTranslationKeyValue(key: MovieProductionCompanyTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .aliases: return aliases
        case .description: return description
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: MovieProductionCompanyTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .aliases:
            aliases = value as? [String]
            break
        case .description:
            description = value as! String
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum MovieProductionCompanyTranslationKeys : String, JsonableTranslationKey {
    case name
    case aliases
    case description
    case sources
}
