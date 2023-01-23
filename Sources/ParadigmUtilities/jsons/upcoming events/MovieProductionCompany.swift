//
//  MovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct MovieProductionCompany : MovieProductionCompanyProtocol {
    public typealias ValueKeys = MovieProductionCompanyValueKeys
    
    public let response_version:Int, id:String
    public var name:String, aliases:[String]?, description:String
    public let image_url:String?
    public var sources:EventSources
    
    public init(response_version: Int, id: String, name: String, aliases: [String]?, description: String, image_url: String?, sources: EventSources) {
        self.response_version = response_version
        self.id = id
        self.name = name
        self.aliases = aliases
        self.description = description
        self.image_url = image_url
        self.sources = sources
    }
    
    public func toPreMovieProductionCompany() -> PreMovieProductionCompany {
        return PreMovieProductionCompany(id: id, name: name, aliases: aliases, imageURL: image_url)
    }
    
    public func getKeyValue(key: MovieProductionCompanyValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .id: return id
        case .name: return name
        case .aliases: return aliases
        case .description: return description
        case .image_url: return image_url
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: MovieProductionCompanyValueKeys, value: T) {
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
        default:
            break
        }
    }
}

public enum MovieProductionCompanyValueKeys : String, JsonableValueKeys {
    case response_version
    case id
    case name
    case aliases
    case description
    case image_url
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .aliases, .description, .sources:
            return true
        default:
            return false
        }
    }
}
