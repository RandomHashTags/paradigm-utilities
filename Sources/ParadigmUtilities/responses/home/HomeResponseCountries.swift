//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension HomeResponse {
    struct Countries : HomeResponseProtocol {        
        public var filters:CountryFiltersResponse?
        
        public init(filters: CountryFiltersResponse?) {
            self.filters = filters
        }
    }
}
