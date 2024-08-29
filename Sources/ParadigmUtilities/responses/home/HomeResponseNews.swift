//
//  HomeResponseNews.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

import Foundation

public struct HomeResponseNews : HomeResponseProtocol {    
    public var regional:[CountryNewsEvents]
    
    public init(regional: [CountryNewsEvents]) {
        self.regional = regional
    }
}