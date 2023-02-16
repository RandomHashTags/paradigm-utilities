//
//  PreHoliday.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public struct PreHoliday : Jsonable {
    public typealias ValueKeys = PreHolidayValueKeys
    
    public let type:String, id:String
    public var name:String
    public let emoji:String?
    public var countries:[Country]?
    
    public init(type: String, id: String, name: String, emoji: String?, countries: [Country]? = nil) {
        self.type = type
        self.id = id
        self.name = name
        self.emoji = emoji
        self.countries = countries
    }
    
    public mutating func addCountry(country: Country) {
        if countries == nil {
            countries = [Country]()
        }
        countries?.append(country)
    }
    
    public func getKeyValue(key: PreHolidayValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .name: return name
        case .emoji: return emoji
        case .countries: return countries
        }
    }
    public mutating func setKeyValue<T>(key: PreHolidayValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        default:
            break
        }
    }
}

public enum PreHolidayValueKeys : String, JsonableValueKeys {
    case type
    case id
    case name
    case emoji
    case countries
    
    public var is_translatable : Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
