//
//  TVShowSchedule.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowSchedule : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let time:String, days:[String]
}
