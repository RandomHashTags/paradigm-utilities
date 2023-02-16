//
//  SubdivisionStatute.swift
//
//
//  Created by Evan Anderson on 9/9/22.
//

import Foundation

public struct SubdivisionStatute : Jsonable {
    public typealias ValueKeys = SubdivisionStatuteValueKeys
    
    public var title:String, description:String?, subdivisions:[SubdivisionStatuteSubdivision]?, sources:EventSources
    
    public init(title: String, description: String?, subdivisions: [SubdivisionStatuteSubdivision]?, sources: EventSources) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
        self.sources = sources
    }
    
    public func getKeyValue(key: SubdivisionStatuteValueKeys) -> Any? {
        switch key {
        case .title: return title
        case .description: return description
        case .subdivisions: return subdivisions
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SubdivisionStatuteValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .description:
            description = value as? String
            break
        case .subdivisions:
            subdivisions = value as? [SubdivisionStatuteSubdivision]
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum SubdivisionStatuteValueKeys : String, JsonableValueKeys {
    case title
    case description
    case subdivisions
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .title, .description, .subdivisions, .sources:
            return true
        }
    }
}
