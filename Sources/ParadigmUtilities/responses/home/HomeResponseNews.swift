//
//  HomeResponseNews.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

import Foundation

public struct HomeResponseNews : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseNewsValueKeys
    
    public var regional:[CountryNewsEvents]
    
    public init(regional: [CountryNewsEvents]) {
        self.regional = regional
    }
    
    public func getKeyValue(key: HomeResponseNewsValueKeys) -> Any? {
        switch key {
        case .regional: return regional
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseNewsValueKeys, value: T) {
        switch key {
        case .regional:
            regional = value as! [CountryNewsEvents]
            break
        }
    }
}

public enum HomeResponseNewsValueKeys : String, JsonableValueKeys {
    case regional
    
    public var is_translatable : Bool {
        switch self {
        case .regional:
            return true
        }
    }
}
