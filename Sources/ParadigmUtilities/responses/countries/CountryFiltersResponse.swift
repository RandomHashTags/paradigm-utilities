//
//  CountryFiltersResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

public struct CountryFiltersResponse : Jsonable {    
    public let response_version:Int
    public var filters:[CountryFilter]!
    
    public init(response_version: Int, filters: [CountryFilter]!) {
        self.response_version = response_version
        self.filters = filters
    }
}