//
//  HomeResponseNews.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

public extension Responses.News {
    struct Home : HomeResponseProtocol {    
        public var regional:[CountryNewsEvents]
        
        public init(regional: [CountryNewsEvents]) {
            self.regional = regional
        }
    }
}
