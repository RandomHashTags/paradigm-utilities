//
//  UpdateRelatedContent.swift
//  
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation
import SwiftSovereignStates

public struct UpdateRelatedContent : Jsonable {
    public typealias JSONKeys = UpdateRelatedContentValueKeys
    
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var sources:EventSources?
    
    public init(countries: [Country]? = nil, subdivisions: [any SovereignStateSubdivision]? = nil, sources: EventSources? = nil) {
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.sources = sources
    }
    
    public func getKeyValue(key: UpdateRelatedContentValueKeys) -> Any? {
        switch key {
        case .countries: return countries
        case .subdivisions: return subdivisions
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: UpdateRelatedContentValueKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum UpdateRelatedContentValueKeys : String, JsonableKeys {
    case countries
    case subdivisions
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .sources:
            return true
        default:
            return false
        }
    }
}
