//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : Jsonable {
    public typealias TranslationKeys = ClientSovereignStateAvailabilityTranslationKeys
    
    public let info:SovereignStateInfo, primaryCategory:SovereignStateAvailabilityCategory, imageURL:String?, value:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, primaryCategory: SovereignStateAvailabilityCategory, imageURL: String?, value: Bool, sources: EventSources?) {
        self.info = info
        self.primaryCategory = primaryCategory
        self.imageURL = imageURL
        self.value = value
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: ClientSovereignStateAvailabilityTranslationKeys) -> Any? {
        switch key {
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: ClientSovereignStateAvailabilityTranslationKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum ClientSovereignStateAvailabilityTranslationKeys : String, JsonableTranslationKey {
    case sources
}
