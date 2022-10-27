//
//  SubdivisionStatuteSubdivision.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteSubdivision : Jsonable {
    public typealias TranslationKeys = SubdivisionStatuteSubdivisionTranslationKeys
    
    public var title:String, description:String, subdivisions:[SubdivisionStatuteSubdivision]?
    
    public init(title: String, description: String, subdivisions: [SubdivisionStatuteSubdivision]?) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
    }
    
    public func getTranslationKeyValue(key: SubdivisionStatuteSubdivisionTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        case .description: return description
        case .subdivisions: return subdivisions
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SubdivisionStatuteSubdivisionTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .description:
            description = value as! String
            break
        case .subdivisions:
            subdivisions = value as? [SubdivisionStatuteSubdivision]
            break
        }
    }
}

public enum SubdivisionStatuteSubdivisionTranslationKeys : String, JsonableTranslationKey {
    case title
    case description
    case subdivisions
}
