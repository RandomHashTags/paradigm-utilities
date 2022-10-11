//
//  IMDbMovieDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct IMDbMovieDetails : Jsonable {
    let rating:String?, ratingReason:String?, runtimeSeconds:Int?, genres:[String]?, imdbRating:Float?
    var imageURL:String?
    let countries:[Country]?, source:String
}
