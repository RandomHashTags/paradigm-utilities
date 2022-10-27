//
//  IMDbMovieDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct IMDbMovieDetails : Jsonable {
    public typealias TranslationKeys = IMDbMovieDetailsTranslationKeys
    
    public let rating:String?
    public var rating_reason:String?
    public let runtime_seconds:Int?
    public var genres:[String]?
    public let imdb_rating:Float?
    public var imageURL:String?
    public let countries:[Country]?, source:String
    
    public init(rating: String?, rating_reason: String?, runtime_seconds: Int?, genres: [String]?, imdb_rating: Float?, imageURL: String? = nil, countries: [Country]?, source: String) {
        self.rating = rating
        self.rating_reason = rating_reason
        self.runtime_seconds = runtime_seconds
        self.genres = genres
        self.imdb_rating = imdb_rating
        self.imageURL = imageURL
        self.countries = countries
        self.source = source
    }
    
    public func getKeyValue(key: IMDbMovieDetailsTranslationKeys) -> Any? {
        switch key {
        case .rating_reason: return rating_reason
        case .genres: return genres
        }
    }
    public mutating func setKeyValue<T>(key: IMDbMovieDetailsTranslationKeys, value: T) {
        switch key {
        case .rating_reason:
            rating_reason = value as? String
            break
        case .genres:
            genres = value as? [String]
            break
        }
    }
}

public enum IMDbMovieDetailsTranslationKeys : String, JsonableTranslationKey {
    case rating_reason
    case genres
}
