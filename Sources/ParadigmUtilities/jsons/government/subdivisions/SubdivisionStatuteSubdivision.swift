//
//  SubdivisionStatuteSubdivision.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteSubdivision : Jsonable {
    public typealias ValueKeys = SubdivisionStatuteSubdivisionValueKeys
    
    public var title:String, description:String, subdivisions:Set<SubdivisionStatuteSubdivision>?
    
    public init(title: String, description: String, subdivisions: Set<SubdivisionStatuteSubdivision>?) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
    }
    
    public func getKeyValue(key: SubdivisionStatuteSubdivisionValueKeys) -> Any? {
        switch key {
        case .title: return title
        case .description: return description
        case .subdivisions: return subdivisions
        }
    }
    public mutating func setKeyValue<T>(key: SubdivisionStatuteSubdivisionValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .description:
            description = value as! String
            break
        case .subdivisions:
            subdivisions = value as? Set<SubdivisionStatuteSubdivision>
            break
        }
    }
}

public enum SubdivisionStatuteSubdivisionValueKeys : String, JsonableValueKeys {
    case title
    case description
    case subdivisions
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title, .description, .subdivisions:
            return true
        }
    }
}
