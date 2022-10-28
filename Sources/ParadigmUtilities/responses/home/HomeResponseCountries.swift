//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseCountries : HomeResponseProtocol {
    public typealias TranslationKeys = HomeResponseCountriesTranslationKeys
    public typealias OmittableKeys = HomeResponseCountriesOmittableKeys
    
    public static func == (lhs: HomeResponseCountries, rhs: HomeResponseCountries) -> Bool {
        return lhs.filters == rhs.filters
    }
    
    @CodableOmittable public var filters:CountryFiltersResponse?
    
    public init(filters: CountryFiltersResponse?) {
        _filters = CodableOmittable(filters)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(filters)
    }
    
    public func getTranslationKeyValue(key: HomeResponseCountriesTranslationKeys) -> Any? {
        switch key {
        case .filters: return filters
        }
    }
    public func setTranslationKeyValue<T>(key: HomeResponseCountriesTranslationKeys, value: T) {
        switch key {
        case .filters:
            _filters = CodableOmittable(value as? CountryFiltersResponse)
            break
        }
    }
    
    public func getOmittableKeyValue(key: HomeResponseCountriesOmittableKeys) -> (any CodableOmittableProtocol)? {
        switch key {
        case .filters: return _filters
        }
    }
    public func setOmittableKeyValue<T: CodableOmittableProtocol>(key: HomeResponseCountriesOmittableKeys, value: T) {
        switch key {
        case .filters:
            _filters = value as! CodableOmittable<CountryFiltersResponse>
            break
        }
    }
}

public enum HomeResponseCountriesTranslationKeys : String, JsonableTranslationKey {
    case filters
}
public enum HomeResponseCountriesOmittableKeys : String, JsonableOmittableKey {
    case filters
}
