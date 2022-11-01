//
//  PreMovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PreMovieProductionCompany : MovieProductionCompanyProtocol {
    public typealias ValueKeys = PreMovieProductionCompanyValueKeys
    
    public let id:String
    public var name:String, aliases:[String]?
    public let imageURL:String?
    
    public init(id: String, name: String, aliases: [String]?, imageURL: String?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.imageURL = imageURL
    }
    
    public func getKeyValue(key: PreMovieProductionCompanyValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .aliases: return aliases
        case .imageURL: return imageURL
        }
    }
    public mutating func setKeyValue<T>(key: PreMovieProductionCompanyValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .aliases:
            aliases = value as? [String]
            break
        default:
            break
        }
    }
}

public enum PreMovieProductionCompanyValueKeys : String, JsonableValueKeys {
    case id
    case name
    case aliases
    case imageURL
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .aliases:
            return true
        default:
            return false
        }
    }
}
