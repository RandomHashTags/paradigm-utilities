//
//  TVShowSchedule.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowSchedule : JsonableNoTranslationKeys {
    public let time:String, days:[String]
}
