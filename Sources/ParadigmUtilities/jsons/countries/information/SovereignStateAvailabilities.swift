//
//  SovereignStateAvailabilities.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateAvailabilities : Jsonable {
    public typealias TranslationKeys = SovereignStateAvailabilitiesTranslationKeys
    
    public let imageURLPrefix:String
    public var availabilities:[ClientSovereignStateAvailability]
    
    public init(imageURLPrefix: String, availabilities: [ClientSovereignStateAvailability]) {
        self.imageURLPrefix = imageURLPrefix
        self.availabilities = availabilities
    }
    
    public func getTranslationKeyValue(key: SovereignStateAvailabilitiesTranslationKeys) -> Any? {
        switch key {
        case .availabilities: return availabilities
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateAvailabilitiesTranslationKeys, value: T) {
        switch key {
        case .availabilities:
            availabilities = value as! [ClientSovereignStateAvailability]
            break
        }
    }
}

public enum SovereignStateAvailabilitiesTranslationKeys : String, JsonableTranslationKey {
    case availabilities
}
