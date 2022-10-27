//
//  MovieRatings.swift
//  
//
//  Created by Evan Anderson on 10/23/22.
//

import Foundation

public struct MovieRatings : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let rotten_tomatoes:String?
    
    public init(rotten_tomatoes: String?) {
        self.rotten_tomatoes = rotten_tomatoes
    }
}
