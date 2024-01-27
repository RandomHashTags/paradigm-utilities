//
//  CountryFiltersResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct CountryFiltersResponse : Jsonable {
    public typealias JSONKeys = CountryFiltersResponseValueKeys
    
    public let response_version:Int
    public var filters:[CountryFilter]!
    
    public init(response_version: Int, filters: [CountryFilter]!) {
        self.response_version = response_version
        self.filters = filters
    }
    
    public func getKeyValue(key: CountryFiltersResponseValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .filters: return filters
        }
    }
    public mutating func setKeyValue<T>(key: CountryFiltersResponseValueKeys, value: T) {
        switch key {
        case .filters:
            filters = value as? [CountryFilter]
            break
        default:
            break
        }
    }
}

public enum CountryFiltersResponseValueKeys : String, JsonableKeys {
    case response_version
    case filters
    
    public var is_translatable : Bool {
        switch self {
        case .filters:
            return true
        default:
            return false
        }
    }
}
