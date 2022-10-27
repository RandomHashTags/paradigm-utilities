//
//  SovereignStateSingleValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateSingleValue : SovereignStateIdentifiableValue {
    public typealias TranslationKeys = SovereignStateSingleValueTranslationKeys
    
    public let info:SovereignStateInfo
    public var notes:String?, value:String, valueDescription:String?
    public let yearOfData:Int
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, value: String, valueDescription: String?, yearOfData: Int, sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.value = value
        self.valueDescription = valueDescription
        self.yearOfData = yearOfData
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateSingleValueTranslationKeys) -> Any? {
        switch key {
        case .notes: return notes
        case .value: return value
        case .valueDescription: return valueDescription
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateSingleValueTranslationKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .value:
            self.value = value as! String
            break
        case .valueDescription:
            valueDescription = value as? String
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateSingleValueTranslationKeys : String, JsonableTranslationKey {
    case notes
    case value
    case valueDescription
    case sources
}
