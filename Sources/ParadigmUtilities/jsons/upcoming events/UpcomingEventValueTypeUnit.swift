//
//  UpcomingEventValueTypeUnit.swift
//
//
//  Created by Evan Anderson on 6/13/22.
//

import Foundation

public enum UpcomingEventValueTypeUnit : String, CaseIterable, Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    case kilometers
    case meters
    case centimeters
    
    case miles
    case feet
    case inches
    
    case yard
    case nautical_miles
}
