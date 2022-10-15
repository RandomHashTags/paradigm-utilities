//
//  CountryFiltersResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct CountryFiltersResponse : Jsonable {
    public let id:String, rankings:[Country:Int]
    
    public init(id: String, rankings: [Country:Int]) {
        self.id = id
        self.rankings = rankings
    }
}
