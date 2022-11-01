//
//  MovieProductionCompaniesResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public final class MovieProductionCompaniesResponse : Jsonable {
    public typealias ValueKeys = MovieProductionCompaniesResponseValueKeys
    
    public static func == (lhs: MovieProductionCompaniesResponse, rhs: MovieProductionCompaniesResponse) -> Bool {
        return lhs.response_version == rhs.response_version && lhs.imageURLPrefix.elementsEqual(rhs.imageURLPrefix) && lhs.companies == rhs.companies
    }
    
    public let response_version:Int, imageURLPrefix:String
    public var companies:[PreMovieProductionCompany]!
    
    public init(response_version: Int, imageURLPrefix: String, companies: [PreMovieProductionCompany]!) {
        self.response_version = response_version
        self.imageURLPrefix = imageURLPrefix
        self.companies = companies
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        hasher.combine(imageURLPrefix)
        hasher.combine(companies)
    }
    
    public func getKeyValue(key: MovieProductionCompaniesResponseValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .imageURLPrefix: return imageURLPrefix
        case .companies: return companies
        }
    }
    public func setKeyValue<T>(key: MovieProductionCompaniesResponseValueKeys, value: T) {
        switch key {
        case .companies:
            companies = value as? [PreMovieProductionCompany]
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
