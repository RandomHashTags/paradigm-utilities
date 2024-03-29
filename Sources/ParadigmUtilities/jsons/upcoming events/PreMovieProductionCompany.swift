//
//  PreMovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PreMovieProductionCompany : MovieProductionCompanyProtocol {
    public typealias JSONKeys = PreMovieProductionCompanyValueKeys
    
    public let id:String
    public var name:String, aliases:[String]?
    public var image_url:String?
    
    public init(id: String, name: String, aliases: [String]?, image_url: String?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.image_url = image_url
    }
    
    public func getKeyValue(key: PreMovieProductionCompanyValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .aliases: return aliases
        case .image_url: return image_url
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

public enum PreMovieProductionCompanyValueKeys : String, JsonableKeys {
    case id
    case name
    case aliases
    case image_url
    
    public var is_translatable : Bool {
        switch self {
        case .name, .aliases:
            return true
        default:
            return false
        }
    }
}
