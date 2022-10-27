//
//  TVShowNetwork.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowNetwork : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let id:Int, name:String, country:TVShowCountry?, officialSite:String?
}
