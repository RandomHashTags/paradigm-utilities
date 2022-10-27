//
//  NumberType.swift
//
//
//  Created by Evan Anderson on 6/25/22.
//

import Foundation

public enum NumberType : String, CaseIterable, Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    case integer
    case double
    case float
    case long
}
