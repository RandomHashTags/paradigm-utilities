//
//  TVShowAlias.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowAlias : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let name:String, country:TVShowCountry?
}
