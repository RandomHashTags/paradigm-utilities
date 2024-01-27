//
//  NationalTrees.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalTrees : SovereignStateNationalValue {
    public typealias JSONKeys = NationalTreesValueKeys
    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: NationalTreesValueKeys) -> Any? {
        switch key {
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: NationalTreesValueKeys, value: T) {
        switch key {
        case .pictures:
            pictures = value as! [WikipediaPicture]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum NationalTreesValueKeys : String, JsonableKeys {
    case pictures
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .pictures, .sources:
            return true
        }
    }
}
