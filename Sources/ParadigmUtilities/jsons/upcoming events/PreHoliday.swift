//
//  PreHoliday.swift
//
//
//  Created by Evan Anderson on 6/17/22.
//

import Foundation
import SwiftSovereignStates

public struct PreHoliday : Jsonable {
    public typealias TranslationKeys = PreHolidayTranslationKeys
    
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
    
    public func getTranslationKeyValue(key: PreHolidayTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .celebrators: return celebrators
        }
    }
    public mutating func setTranslationKeyValue<T>(key: PreHolidayTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .celebrators:
            celebrators = value as? String
            break
        }
    }
}

public enum PreHolidayTranslationKeys : String, JsonableTranslationKey {
    case name
    case celebrators
}
