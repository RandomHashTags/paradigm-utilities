//
//  MovieProductionCompaniesResponse.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct MovieProductionCompaniesResponse : Jsonable {    
    public let response_version:Int, image_url_prefix:String
    public var companies:[PreMovieProductionCompany]
    
    public init(response_version: Int, image_url_prefix: String, companies: [PreMovieProductionCompany]!) {
        self.response_version = response_version
        self.image_url_prefix = image_url_prefix
        self.companies = companies
    }
}