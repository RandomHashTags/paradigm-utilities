//
//  HomeResponseCountries.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public extension HomeResponse {
    struct Countries : HomeResponseProtocol {        
        public var filters:CountryFiltersResponse?
        
        public init(filters: CountryFiltersResponse?) {
            self.filters = filters
        }
    }
}
