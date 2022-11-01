//
//  CountryFiltersResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public final class CountryFiltersResponse : Jsonable {
    public typealias ValueKeys = CountryFiltersResponseValueKeys
    
    public static func == (lhs: CountryFiltersResponse, rhs: CountryFiltersResponse) -> Bool {
        return lhs.response_version == rhs.response_version && lhs.filters == rhs.filters
    }
    
    public let response_version:Int
    public var filters:[CountryFilter]!
    
    public init(response_version: Int, filters: [CountryFilter]!) {
        self.response_version = response_version
        self.filters = filters
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        hasher.combine(filters)
    }
    
    public func getKeyValue(key: CountryFiltersResponseValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .filters: return filters
        }
    }
    public func setKeyValue<T>(key: CountryFiltersResponseValueKeys, value: T) {
        switch key {
        case .filters:
            filters = value as? [CountryFilter]
            break
        default:
            break
        }
    }
}

public enum CountryFiltersResponseValueKeys : String, JsonableValueKeys {
    case response_version
    case filters
    
    public func isTranslatable() -> Bool {
        switch self {
        case .filters:
            return true
        default:
            return false
        }
    }
}
