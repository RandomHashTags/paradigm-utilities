//
//  SubdivisionLegislationType.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public enum SubdivisionLegislationType : String, Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    case index
    case chapter
    case section
}
