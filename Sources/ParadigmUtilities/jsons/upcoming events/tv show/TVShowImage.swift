//
//  TVShowImage.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowImage : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let medium:String, original:String
}
