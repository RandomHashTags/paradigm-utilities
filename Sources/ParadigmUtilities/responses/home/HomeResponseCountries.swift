//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct HomeResponseCountries : HomeResponseProtocol {
    public typealias JSONKeys = HomeResponseCountriesValueKeys
    
    public var filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        self.filters = filters
    }
    
    public func getKeyValue(key: HomeResponseCountriesValueKeys) -> Any? {
        switch key {
        case .filters: return filters
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseCountriesValueKeys, value: T) {
        switch key {
        case .filters:
            filters = value as? CountryFiltersResponse
            break
        }
    }
}

public enum HomeResponseCountriesValueKeys : String, JsonableKeys {
    case filters
}
