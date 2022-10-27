//
//  TVShowPerson.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowPerson : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let name:String, birthday:String?, deathday:String?, imageURL:String?, country:TVShowCountry?, image:TVShowImage?, url:String
}
