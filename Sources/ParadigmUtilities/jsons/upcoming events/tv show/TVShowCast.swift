//
//  TVShowCast.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowCast : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let person:TVShowPerson?
    public let character:TVShowPerson?
    public let `self`:Bool, voice:Bool
}
