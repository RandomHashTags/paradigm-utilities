//
//  PreNationalPark.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNationalPark : SovereignStateInformationValue {
    public typealias TranslationKeys = PreNationalParkTranslationKeys
    
    public let id:String
    public var name:String
    public let imageURL:String?, country:Country
    public var sources:EventSources?
    
    public init(id: String, name: String, imageURL: String?, country: Country) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
        sources = nil
    }
    
    public func getKeyValue(key: PreNationalParkTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        }
    }
    public mutating func setKeyValue<T>(key: PreNationalParkTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        }
    }
}

public enum PreNationalParkTranslationKeys : String, JsonableTranslationKey {
    case name
}
