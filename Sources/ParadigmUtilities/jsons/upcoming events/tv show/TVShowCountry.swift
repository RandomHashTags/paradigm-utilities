//
//  TVShowCountry.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowCountry : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let name:String, code:String, timezone:String
}
