//
//  MovieProductionCompaniesResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct MovieProductionCompaniesResponse : Jsonable {
    public let response_version:Int
    public var companies:[PreMovieProductionCompany]!
    
    public init(response_version: Int, companies: [PreMovieProductionCompany]!) {
        self.response_version = response_version
        self.companies = companies
    }
}
