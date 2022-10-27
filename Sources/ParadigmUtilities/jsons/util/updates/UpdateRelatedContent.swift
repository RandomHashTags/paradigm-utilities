//
//  UpdateRelatedContent.swift
//  
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation
import SwiftSovereignStates

public struct UpdateRelatedContent : Jsonable {
    public typealias TranslationKeys = UpdateRelatedContentTranslationKeys
    
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var sources:EventSources?
    
    public init(countries: [Country]? = nil, subdivisions: [any SovereignStateSubdivision]? = nil, sources: EventSources? = nil) {
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: UpdateRelatedContentTranslationKeys) -> Any? {
        switch key {
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: UpdateRelatedContentTranslationKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum UpdateRelatedContentTranslationKeys : String, JsonableTranslationKey {
    case sources
}
