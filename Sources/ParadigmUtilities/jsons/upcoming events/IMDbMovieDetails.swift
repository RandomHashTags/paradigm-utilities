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
}