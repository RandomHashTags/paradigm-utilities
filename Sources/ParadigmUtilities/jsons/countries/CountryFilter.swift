//
//  CountryFilter.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct CountryFilter : Jsonable {
    public typealias JSONKeys = CountryFilterValueKeys
    
    public let id:String
    public var title:String
    
    public init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    public func getKeyValue(key: CountryFilterValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .title: return title
        }
    }
    public mutating func setKeyValue<T>(key: CountryFilterValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        default:
            break
        }
    }
}

public enum CountryFilterValueKeys : String, JsonableKeys {
    case id
    case title
    
    public var is_translatable : Bool {
        switch self {
        case .title:
            return true
        default:
            return false
        }
    }
}
