//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseCountries : HomeResponseProtocol {
    public typealias JSONKeys = HomeResponseCountriesValueKeys
    
    @CodableOmittable public var filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        _filters = CodableOmittable(filters)
    }
    
    public func getKeyValue(key: HomeResponseCountriesValueKeys) -> Any? {
        switch key {
        case .filters: return _filters
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseCountriesValueKeys, value: T) {
        switch key {
        case .filters:
            _filters = value as! CodableOmittable<CountryFiltersResponse>
            break
        }
    }
}

public enum HomeResponseCountriesValueKeys : String, JsonableKeys {
    case filters
    
    public var is_translatable : Bool {
        switch self {
        case .filters:
            return true
        }
    }
    public var is_omittable : Bool {
        switch self {
        case .filters:
            return true
        }
    }
}
