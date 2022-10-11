//
//  IMDbMovieDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct IMDbMovieDetails : Jsonable {
    public let rating:String?, ratingReason:String?, runtimeSeconds:Int?, genres:[String]?, imdbRating:Float?
    public var imageURL:String?
    public let countries:[Country]?, source:String
    
    public init(rating: String?, ratingReason: String?, runtimeSeconds: Int?, genres: [String]?, imdbRating: Float?, imageURL: String? = nil, countries: [Country]?, source: String) {
        self.rating = rating
        self.ratingReason = ratingReason
        self.runtimeSeconds = runtimeSeconds
        self.genres = genres
        self.imdbRating = imdbRating
        self.imageURL = imageURL
        self.countries = countries
        self.source = source
    }
}
