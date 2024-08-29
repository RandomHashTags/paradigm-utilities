//
//  HomeResponseNews.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

public extension HomeResponse {
    struct News : HomeResponseProtocol {    
        public var regional:[CountryNewsEvents]
        
        public init(regional: [CountryNewsEvents]) {
            self.regional = regional
        }
    }
}
