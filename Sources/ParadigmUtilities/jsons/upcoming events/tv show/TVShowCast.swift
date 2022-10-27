//
//  TVShowCast.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowCast : JsonableNoTranslationKeys {
    public let person:TVShowPerson?
    public let character:TVShowPerson?
    public let `self`:Bool, voice:Bool
}
