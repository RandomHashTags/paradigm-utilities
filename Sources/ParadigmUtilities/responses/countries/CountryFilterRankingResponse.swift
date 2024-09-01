//
//  CountryFilterRankingResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import SwiftSovereignStates

public extension Responses.Countries {
    struct CountryFilterRankingResponse : Jsonable {
        public let id:String, rankings:[Country:Int]
        
        public init(id: String, rankings: [Country:Int]) {
            self.id = id
            self.rankings = rankings
        }
    }
}