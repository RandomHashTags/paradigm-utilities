//
//  MovieProductionCompaniesResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct MovieProductionCompaniesResponse : Jsonable {
    public typealias ValueKeys = MovieProductionCompaniesResponseValueKeys
    
    public let response_version:Int, imageURLPrefix:String
    public var companies:[PreMovieProductionCompany]
    
    public init(response_version: Int, imageURLPrefix: String, companies: [PreMovieProductionCompany]!) {
        self.response_version = response_version
        self.imageURLPrefix = imageURLPrefix
        self.companies = companies
    }
    
    public func getKeyValue(key: MovieProductionCompaniesResponseValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .imageURLPrefix: return imageURLPrefix
        case .companies: return companies
        }
    }
    public mutating func setKeyValue<T>(key: MovieProductionCompaniesResponseValueKeys, value: T) {
        switch key {
        case .companies:
            companies = value as! [PreMovieProductionCompany]
            break
        default:
            break
        }
    }
}

public enum MovieProductionCompaniesResponseValueKeys : String, JsonableValueKeys {
    case response_version
    case imageURLPrefix
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
