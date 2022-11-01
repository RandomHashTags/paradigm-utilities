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
    
    public let id:String
    public var name:String, type:String, emoji:String?
    public var celebrators:String?, countries:[Country]?
    
    public init(id: String, name: String, type: String, emoji: String?, celebrators: String?, countries: [Country]? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.emoji = emoji
        self.celebrators = celebrators
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
        case .id: return id
        case .name: return name
        case .type: return type
        case .emoji: return emoji
        case .celebrators: return celebrators
        case .countries: return countries
        }
    }
    public mutating func setKeyValue<T>(key: PreHolidayValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .celebrators:
            celebrators = value as? String
            break
        default:
            break
        }
    }
}

public enum PreHolidayValueKeys : String, JsonableValueKeys {
    case id
    case name
    case type
    case emoji
    case celebrators
    case countries
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .celebrators:
            return true
        default:
            return false
        }
    }
}
