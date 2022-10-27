//
//  TVShowExternals.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowExternals : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let tvrage:Int?, thetvdb:Int?, imdb:String?
}
