//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseCountries : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseCountriesValueKeys
    
    public static func == (lhs: HomeResponseCountries, rhs: HomeResponseCountries) -> Bool {
        return lhs.filters == rhs.filters
    }
    
    @CodableOmittable public var filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        _filters = CodableOmittable(filters)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_filters)
    }
    
    public func getKeyValue(key: HomeResponseCountriesValueKeys) -> Any? {
        switch key {
        case .filters: return _filters
        }
    }
    public func setKeyValue<T>(key: HomeResponseCountriesValueKeys, value: T) {
        switch key {
        case .filters:
            _filters = value as! CodableOmittable<CountryFiltersResponse>
            break
        }
    }
}

public enum HomeResponseCountriesValueKeys : String, JsonableValueKeys {
    case filters
    
    public func isTranslatable() -> Bool {
        switch self {
        case .filters:
            return true
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .filters:
            return true
        }
    }
}
