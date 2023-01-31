//
//  MovieProductionCompaniesResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct MovieProductionCompaniesResponse : Jsonable {
    public typealias ValueKeys = MovieProductionCompaniesResponseValueKeys
    
    public let response_version:Int, image_url_prefix:String
    public var companies:Set<PreMovieProductionCompany>
    
    public init(response_version: Int, image_url_prefix: String, companies: Set<PreMovieProductionCompany>) {
        self.response_version = response_version
        self.image_url_prefix = image_url_prefix
        self.companies = companies
    }
    
    public func getKeyValue(key: MovieProductionCompaniesResponseValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .image_url_prefix: return image_url_prefix
        case .companies: return companies
        }
    }
    public mutating func setKeyValue<T>(key: MovieProductionCompaniesResponseValueKeys, value: T) {
        switch key {
        case .companies:
            companies = value as! Set<PreMovieProductionCompany>
            break
        default:
            break
        }
    }
}

public enum MovieProductionCompaniesResponseValueKeys : String, JsonableValueKeys {
    case response_version
    case image_url_prefix
    case companies
    
    public func isTranslatable() -> Bool {
        switch self {
        case .companies:
            return true
        default:
            return false
        }
    }
}
