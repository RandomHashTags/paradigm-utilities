//
//  HumanName.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct HumanName : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let first:String, middle:String?, last:String
    
    public init(first: String, middle: String? = nil, last: String) {
        self.first = first
        self.middle = middle
        self.last = last
    }
}
