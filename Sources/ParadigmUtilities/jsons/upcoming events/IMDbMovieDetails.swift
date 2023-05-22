//
//  IMDbMovieDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct IMDbMovieDetails : Jsonable {    
    public let rating:String?
    public var rating_reason:String?
    public let runtime_seconds:Int?
    public var genres:[String]?
    public let imdb_rating:Float?
    public var image_url:String?
    public let countries:[Country]?, source:String
    
    public init(rating: String?, rating_reason: String?, runtime_seconds: Int?, genres: [String]?, imdb_rating: Float?, image_url: String? = nil, countries: [Country]?, source: String) {
        self.rating = rating
        self.rating_reason = rating_reason
        self.runtime_seconds = runtime_seconds
        self.genres = genres
        self.imdb_rating = imdb_rating
        self.image_url = image_url
        self.countries = countries
        self.source = source
    }
    
    public func getKeyValue(key: IMDbMovieDetailsValueKeys) -> Any? {
        switch key {
        case .rating: return rating
        case .rating_reason: return rating_reason
        case .runtime_seconds: return runtime_seconds
        case .genres: return genres
        case .imdb_rating: return imdb_rating
        case .image_url: return image_url
        case .countries: return countries
        case .source: return source
        }
    }
    public mutating func setKeyValue<T>(key: IMDbMovieDetailsValueKeys, value: T) {
        switch key {
        case .rating_reason:
            rating_reason = value as? String
            break
        case .genres:
            genres = value as? [String]
            break
        case .image_url:
            image_url = value as? String
            break
        default:
            break
        }
    }
}

public enum IMDbMovieDetailsValueKeys : String, JsonableValueKeys {
    case rating
    case rating_reason
    case runtime_seconds
    case genres
    case imdb_rating
    case image_url
    case countries
    case source
    
    public var is_translatable : Bool {
        switch self {
        case .rating_reason, .genres:
            return true
        default:
            return false
        }
    }
}
